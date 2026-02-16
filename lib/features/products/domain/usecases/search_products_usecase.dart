import 'package:peng_cafe/features/products/domain/repositories/product_repository.dart';

import '../../../../core/resource/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/product_entity.dart';

class SearchProductsParams {
  final String query;
  final String locale;

  SearchProductsParams({required this.query, required this.locale});
}

class SearchProductsUsecase
    implements UseCase<DataState<List<ProductEntity>>, SearchProductsParams> {
  final ProductRepository repository;

  SearchProductsUsecase(this.repository);

  @override
  Future<DataState<List<ProductEntity>>> call({
    required SearchProductsParams params,
  }) {
    return repository.searchProducts(
      query: params.query,
      locale: params.locale,
    );
  }
}
