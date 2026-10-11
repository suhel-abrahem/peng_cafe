import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:integration_test/integration_test.dart';

import 'package:peng_cafe/features/licensing/data/repositories/signed_license_cache.dart';
import 'package:peng_cafe/features/licensing/data/services/device_identity_vault.dart';
import 'package:peng_cafe/features/licensing/data/services/license_renewal_service.dart';
import 'package:peng_cafe/features/licensing/data/services/secure_license_cache_storage.dart';
import 'package:peng_cafe/features/licensing/data/services/trusted_license_keys.dart';
import 'package:peng_cafe/features/licensing/domain/services/license_validator.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Renew real Peng license from Flutter Windows', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: Center(child: Text('Peng live renewal test'))),
      ),
    );

    const secureStorage = FlutterSecureStorage();

    final vault = DeviceIdentityVault(secureStorage);

    final identity = await vault.loadIdentity();

    expect(
      identity,
      isNotNull,
      reason: 'Run the Windows device import test first.',
    );

    expect(identity!.deviceId, 'b514f012-b087-4b4c-ae38-eb3e34d96d16');

    final cache = SignedLicenseCache(SecureLicenseCacheStorage(secureStorage));

    final verifier = await TrustedLicenseKeys.load();
    final validator = LicenseValidator(verifier);

    final client = http.Client();
    addTearDown(client.close);

    final service = LicenseRenewalService(
      client: client,
      baseUrl: Uri.parse('http://127.0.0.1:5069/'),
      deviceVault: vault,
      licenseCache: cache,
      validator: validator,
    );

    // REAL HTTP → ASP.NET Core → PostgreSQL.
    final result = await service.renew();

    expect(
      result.outcome,
      LicenseRenewalOutcome.renewed,
      reason: result.message,
    );

    // Confirm the signed entitlement was saved.
    final cachedLicense = await cache.load();

    expect(cachedLicense, isNotNull);

    // Validate the cached entitlement again.
    final validation = await validator.validate(
      signedLicense: cachedLicense!,
      expectedBusinessId: identity.businessId,
      expectedProductId: identity.productId,
      expectedDeviceId: identity.deviceId,
      expectedDevicePublicKeySpkiBase64: identity.publicKeySpkiBase64,
    );

    expect(validation.isValid, isTrue, reason: validation.status.name);
  });
}
