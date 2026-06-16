class CheckoutResult {
  final double paidAmount;

  final double paidInIqd;
  final double remaining;
  final String? clientName;
  CheckoutResult({
    required this.paidAmount,

    required this.paidInIqd,
    required this.remaining,
    required this.clientName,
  });
}
