import 'package:peng_cafe/core/resource/data_state.dart';
import 'package:peng_cafe/core/usecase/usecase.dart';
import 'package:peng_cafe/features/table_page/domain/entities/order_entity.dart';

import '../../data/models/order_model.dart';
import '../repositories/table_repository.dart';

class GetOrCreateOrderUsecase
    implements UseCase<DataState<OrderEntity?>, OrderModel> {
  final TableRepository _repository;
  GetOrCreateOrderUsecase(this._repository);
  @override
  Future<DataState<OrderEntity?>> call({OrderModel? params}) async {
    return await _repository.getActiveOrderByTable(orderModel: params);
  }
}
