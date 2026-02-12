import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peng_cafe/features/products/domain/usecases/get_all_product_usecase.dart';

import '../../../../core/resource/data_state.dart';
import '../../data/models/product_model.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_produtc_usecase.dart';

part 'get_products_event.dart';
part 'get_products_state.dart';
part 'get_products_bloc.freezed.dart';

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  final GetAllProductUsecase _getAllProductUsecase;
  final GetProdutcUsecase _getProductUsecase;
  GetProductsBloc(this._getAllProductUsecase, this._getProductUsecase)
    : super(GetProductsState.initial()) {
    on<GetProductsEventStarted>((event, emit) {
      emit(const GetProductsState.initial());
    });
    on<GetProductsEventGetProducts>((event, emit) async {
      emit(const GetProductsState.loading());
      await _getAllProductUsecase.call(params: event.productsModel).then((
        dataState,
      ) async {
        if (dataState is DataSuccess) {
          List<ProductEntity>? products = dataState?.data ?? [];
          if (products.isEmpty) {
            emit(const GetProductsState.noData());
            return;
          }
          emit(GetProductsState.loaded(products));
        } else if (dataState is NoDataDataState) {
          emit(const GetProductsState.noData());
        } else {
          emit(
            GetProductsState.error(
              dataState?.error ?? "An unknown error occurred",
            ),
          );
        }
      });
    });
    on<GetProductsEventGetProduct>((event, emit) async {
      emit(const GetProductsState.loading());
      await _getProductUsecase.call(params: event.productModel).then((
        dataState,
      ) async {
        if (dataState is DataSuccess) {
          ProductEntity? product = dataState?.data;
          if (product == null) {
            emit(const GetProductsState.noData());
            return;
          }
          emit(GetProductsState.loaded([product]));
        } else if (dataState is NotFoundDataState) {
          emit(const GetProductsState.noData());
        } else {
          emit(
            GetProductsState.error(
              dataState?.error ?? "An unknown error occurred",
            ),
          );
        }
      });
    });
  }
}
