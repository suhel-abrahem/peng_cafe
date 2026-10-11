class LicensedDeviceIdentity {
  final String businessId;
  final String productId;
  final String deviceId;
  final String publicKeySpkiBase64;

  const LicensedDeviceIdentity({
    required this.businessId,
    required this.productId,
    required this.deviceId,
    required this.publicKeySpkiBase64,
  });
}
