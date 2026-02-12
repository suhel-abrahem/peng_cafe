import '../../../../core/resource/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/product_model.dart';
import '../repositories/product_repository.dart';

class UpdateProductUsecase implements UseCase<DataState<void>?, ProductModel> {
  final ProductRepository _repository;
  UpdateProductUsecase(this._repository);
  @override
  Future<DataState<void>?> call({ProductModel? params}) async {
    return await _repository.updateProduct(params);
  }
}
