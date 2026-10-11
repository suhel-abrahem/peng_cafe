import '../../data/repositories/signed_license_cache.dart';
import '../entities/licensed_device_identity.dart';
import 'license_validator.dart';

enum LicenseStartupStatus { licensed, activationRequired, blocked }

class LicenseStartupResult {
  final LicenseStartupStatus status;
  final LicenseValidationStatus? reason;

  const LicenseStartupResult(this.status, {this.reason});

  bool get canOpenCashier => status == LicenseStartupStatus.licensed;
}

class LicenseStartupService {
  final SignedLicenseCache cache;
  final LicenseValidator validator;

  const LicenseStartupService({required this.cache, required this.validator});

  Future<LicenseStartupResult> check({
    required LicensedDeviceIdentity device,
    DateTime? nowUtc,
  }) async {
    try {
      final signedLicense = await cache.load();

      if (signedLicense == null) {
        return const LicenseStartupResult(
          LicenseStartupStatus.activationRequired,
        );
      }

      final result = await validator.validate(
        signedLicense: signedLicense,
        expectedBusinessId: device.businessId,
        expectedProductId: device.productId,
        expectedDeviceId: device.deviceId,
        expectedDevicePublicKeySpkiBase64: device.publicKeySpkiBase64,
        nowUtc: nowUtc,
      );

      if (!result.isValid) {
        return LicenseStartupResult(
          LicenseStartupStatus.blocked,
          reason: result.status,
        );
      }

      return const LicenseStartupResult(LicenseStartupStatus.licensed);
    } catch (_) {
      // Unreadable or corrupted storage must never
      // grant cashier access.
      return const LicenseStartupResult(LicenseStartupStatus.blocked);
    }
  }
}
