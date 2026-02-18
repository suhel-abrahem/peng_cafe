import '../../../../core/resource/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../table_page/domain/entities/order_entity.dart';
import '../../../table_page/domain/entities/order_item_entity.dart';
import '../repositories/orders_repository.dart';

class GetOrderDetailsUsecase
    implements
        UseCase<
          DataState<(OrderEntity, List<OrderItemEntity>)>,
          GetOrderDetailsParams
        > {
  final OrdersRepository repository;

  GetOrderDetailsUsecase(this.repository);

  @override
  Future<DataState<(OrderEntity, List<OrderItemEntity>)>> call({
    required GetOrderDetailsParams params,
  }) async {
    try {
      final order = await repository.getOrder(params.orderId);
      if (order == null) {
        return const DataFailed(error: 'Order not found');
      }

      final items = await repository.getOrderItems(
        orderId: params.orderId,
        locale: params.locale,
      );

      return DataSuccess(data: (order, items));
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }
}

class GetOrderDetailsParams {
  final int orderId;
  final String locale;

  GetOrderDetailsParams({required this.orderId, required this.locale});
}
