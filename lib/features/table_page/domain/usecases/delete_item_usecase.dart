import '../../../../core/usecase/usecase.dart';
import '../repositories/table_repository.dart';

class DeleteItemUsecase implements UseCase<void, DeleteOrderItemParams> {
  final TableRepository repository;

  DeleteItemUsecase(this.repository);

  @override
  Future<void> call({DeleteOrderItemParams? params}) async {
    await repository.deleteOrderItem(
      itemId: params?.itemId,
      orderId: params?.orderId,
    );
  }
}

class DeleteOrderItemParams {
  final int itemId;
  final int orderId;

  DeleteOrderItemParams({required this.itemId, required this.orderId});
}
