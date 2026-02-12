import 'package:peng_cafe/core/usecase/usecase.dart';

import '../../../../core/resource/data_state.dart';
import '../repositories/product_repository.dart';

class DeleteAllProductUsecase implements UseCase<DataState<void>?, NoParams> {
  final ProductRepository _repository;
  DeleteAllProductUsecase(this._repository);

  @override
  Future<DataState<void>?> call({NoParams? params}) async {
    return await _repository.deleteAllProducts(params ?? NoParams());
  }
}
