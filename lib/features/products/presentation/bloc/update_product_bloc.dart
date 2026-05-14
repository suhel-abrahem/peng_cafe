import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peng_cafe/core/resource/data_state.dart';
import 'package:peng_cafe/features/products/data/models/product_model.dart';
import 'package:peng_cafe/features/products/domain/usecases/update_product_usecase.dart';

part 'update_product_event.dart';
part 'update_product_state.dart';
part 'update_product_bloc.freezed.dart';

class UpdateProductBloc extends Bloc<UpdateProductEvent, UpdateProductState> {
  final UpdateProductUsecase _updateProductUsecase;
  UpdateProductBloc(this._updateProductUsecase) : super(_Initial()) {
    on<_Started>((event, emit) {
      emit(UpdateProductState.initial());
    });
    on<_Update>((event, emit) async {
      emit(_Loading());
      final response = await _updateProductUsecase.call(
        params: event.productMode,
      );
      if (response is DataSuccess) {
        emit(_Updated());
      } else {
        emit(_Error(response?.error ?? "SomeThing wrong"));
      }
    });
  }
}
