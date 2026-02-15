import 'package:peng_cafe/core/resource/data_state.dart';
import 'package:peng_cafe/core/usecase/usecase.dart';

import '../../data/models/order_item_model.dart';
import '../repositories/table_repository.dart';

class UpdateItemUsecase implements UseCase<DataState<void>, OrderItemModel> {
  final TableRepository _repository;

  UpdateItemUsecase(this._repository);

  @override
  Future<DataState<void>> call({OrderItemModel? params}) async {
    return await _repository.updateItemQuantity(orderModel: params!);
  }
}
