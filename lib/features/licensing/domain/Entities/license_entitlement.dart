class LicenseEntitlement {
  final int version;
  final String businessId;
  final String productId;
  final String subscriptionId;
  final String deviceId;
  final String licenseId;
  final String devicePublicKeySpkiBase64;
  final DateTime issuedAtUtc;
  final DateTime validUntilUtc;
  final DateTime subscriptionEndsAtUtc;

  const LicenseEntitlement({
    required this.version,
    required this.businessId,
    required this.productId,
    required this.subscriptionId,
    required this.deviceId,
    required this.licenseId,
    required this.devicePublicKeySpkiBase64,
    required this.issuedAtUtc,
    required this.validUntilUtc,
    required this.subscriptionEndsAtUtc,
  });

  factory LicenseEntitlement.fromJson(Map<String, dynamic> json) {
    String requiredString(String key) {
      final value = json[key];

      if (value is! String || value.trim().isEmpty) {
        throw FormatException('Invalid $key');
      }

      return value;
    }

    DateTime requiredUtcDate(String key) {
      final value = requiredString(key);
      final parsed = DateTime.tryParse(value);

      if (!value.endsWith('Z') || parsed == null || !parsed.isUtc) {
        throw FormatException('Invalid UTC date: $key');
      }

      return parsed;
    }

    final version = json['version'];

    if (version is! int) {
      throw const FormatException('Invalid license version');
    }

    return LicenseEntitlement(
      version: version,
      businessId: requiredString('businessId'),
      productId: requiredString('productId'),
      subscriptionId: requiredString('subscriptionId'),
      deviceId: requiredString('deviceId'),
      licenseId: requiredString('licenseId'),
      devicePublicKeySpkiBase64: requiredString('devicePublicKeySpkiBase64'),
      issuedAtUtc: requiredUtcDate('issuedAtUtc'),
      validUntilUtc: requiredUtcDate('validUntilUtc'),
      subscriptionEndsAtUtc: requiredUtcDate('subscriptionEndsAtUtc'),
    );
  }
}
