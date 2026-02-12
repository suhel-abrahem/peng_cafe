import '../../../../core/usecase/usecase.dart';
import '../../../../core/resource/data_state.dart';
import '../repositories/product_repository.dart';

class DeleteSelectedProductsUsecase
    implements UseCase<DataState<void>?, List<int>> {
  final ProductRepository _repository;
  DeleteSelectedProductsUsecase(this._repository);

  @override
  Future<DataState<void>?> call({List<int>? params}) async {
    return await _repository.deleteSelectedProducts(params ?? []);
  }
}
