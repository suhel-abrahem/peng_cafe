import '../../../../core/resource/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/order_item_entity.dart';
import '../repositories/table_repository.dart';

class GetOrderItemsUsecase
    implements UseCase<DataState<List<OrderItemEntity>>, GetOrderItemsParams> {
  final TableRepository repository;

  GetOrderItemsUsecase(this.repository);

  @override
  Future<DataState<List<OrderItemEntity>>> call({
    required GetOrderItemsParams params,
  }) {
    return repository.getOrderItems(params: params);
  }
}
