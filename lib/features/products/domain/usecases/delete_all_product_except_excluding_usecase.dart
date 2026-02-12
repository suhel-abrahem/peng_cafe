import 'package:peng_cafe/core/resource/data_state.dart';

import '../../../../core/usecase/usecase.dart';
import '../repositories/product_repository.dart';

class DeleteAllProductExceptExcludingUsecase
    implements UseCase<DataState<void>?, List<int>> {
  final ProductRepository _repository;
  DeleteAllProductExceptExcludingUsecase(this._repository);

  @override
  Future<DataState<void>?> call({List<int>? params}) async {
    return await _repository.deleteAllExceptExcludedProducts(params ?? []);
  }
}
