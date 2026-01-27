import 'package:peng_cafe/core/resource/data_state.dart';
import 'package:peng_cafe/features/products/data/models/product_model.dart';

import '../../../../core/usecase/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetAllProductUsecase
    implements UseCase<DataState<List<ProductEntity>?>?, ProductModel> {
  final ProductRepository _repository;

  GetAllProductUsecase(this._repository);

  @override
  Future<DataState<List<ProductEntity>?>?> call({ProductModel? params}) async {
    return await _repository.getAllProducts(params);
  }
}
