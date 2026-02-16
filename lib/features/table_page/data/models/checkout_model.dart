import '../../../../core/enums/currency_enum.dart';

class CheckoutResult {
  final double paidAmount;

  final double paidInIqd;
  final double remaining;

  CheckoutResult({
    required this.paidAmount,

    required this.paidInIqd,
    required this.remaining,
  });
}
