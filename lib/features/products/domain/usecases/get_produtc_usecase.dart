import 'package:peng_cafe/core/resource/data_state.dart';
import 'package:peng_cafe/core/usecase/usecase.dart';
import 'package:peng_cafe/features/products/data/models/product_model.dart';
import 'package:peng_cafe/features/products/domain/entities/product_entity.dart';
import 'package:peng_cafe/features/products/domain/repositories/product_repository.dart';

class GetProdutcUsecase
    implements UseCase<DataState<ProductEntity?>?, ProductModel> {
  final ProductRepository _repository;
  GetProdutcUsecase(this._repository);
  @override
  Future<DataState<ProductEntity?>?> call({ProductModel? params}) async {
    return await _repository.getProduct(params);
  }
}
