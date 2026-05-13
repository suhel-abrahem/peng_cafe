import 'package:peng_cafe/core/resource/data_state.dart';
import 'package:peng_cafe/core/usecase/usecase.dart';
import 'package:peng_cafe/features/orders/domain/repositories/orders_repository.dart';

class DeleteOrderByIdUsecase implements UseCase<DataState<void>, int> {
  final OrdersRepository _ordersRepository;

  DeleteOrderByIdUsecase({required OrdersRepository ordersRepository})
    : _ordersRepository = ordersRepository;
  @override
  Future<DataState<void>> call({required int params}) async {
    return await _ordersRepository.deleteOrderById(params);
  }
}
