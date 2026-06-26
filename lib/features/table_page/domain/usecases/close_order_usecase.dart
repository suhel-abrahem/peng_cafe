import '../../../../core/resource/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/table_repository.dart';

class CloseOrderParams {
  final int orderId;
  final double paidAmount;
  final double remaining;
  final String? customerName;

  CloseOrderParams({
    required this.orderId,
    required this.paidAmount,
    required this.remaining,
    this.customerName,
  });
}

class CloseOrderUsecase implements UseCase<DataState<void>, CloseOrderParams> {
  final TableRepository repository;

  CloseOrderUsecase(this.repository);

  @override
  Future<DataState<void>> call({required CloseOrderParams params}) async {
    return await repository.closeOrder(
      orderId: params.orderId,
      paidAmount: params.paidAmount,
      remaining: params.remaining,
      customerName: params.customerName,
    );
  }
}
