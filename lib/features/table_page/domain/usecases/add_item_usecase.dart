import 'package:peng_cafe/features/table_page/data/models/order_item_model.dart';
import 'package:peng_cafe/features/table_page/domain/repositories/table_repository.dart';

import '../../../../core/resource/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/order_item_entity.dart';

class AddItemUsecase
    implements UseCase<DataState<OrderItemEntity?>, OrderItemModel> {
  final TableRepository _repository;

  AddItemUsecase(this._repository);

  @override
  Future<DataState<OrderItemEntity?>> call({required OrderItemModel params}) {
    return _repository.addItem(orderModel: params);
  }
}
