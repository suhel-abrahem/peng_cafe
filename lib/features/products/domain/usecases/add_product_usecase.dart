import 'package:peng_cafe/core/resource/data_state.dart';
import 'package:peng_cafe/core/usecase/usecase.dart';

import '../../data/models/product_model.dart';
import '../repositories/product_repository.dart';

class AddProductUsecase implements UseCase<DataState<void>?, ProductModel> {
  final ProductRepository _repository;
  AddProductUsecase(this._repository);

  @override
  Future<DataState<void>?> call({ProductModel? params}) async {
    return await _repository.insertProduct(params);
  }
}
