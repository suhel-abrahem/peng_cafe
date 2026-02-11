import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/resource/data_state.dart';
import '../../data/models/product_model.dart';
import '../../domain/usecases/add_product_usecase.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';
part 'add_product_bloc.freezed.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  final AddProductUsecase _addProductUsecase;
  AddProductBloc(this._addProductUsecase)
    : super(const AddProductState.initial()) {
    on<AddProductEventStarted>((event, emit) {
      emit(const AddProductState.initial());
    });
    on<AddProductEventAddProduct>((event, emit) async {
      emit(const AddProductState.loading());
      await _addProductUsecase.call(params: event.productModel).then((
        dataState,
      ) async {
        if (dataState is DataSuccess) {
          emit(const AddProductState.success());
        } else {
          emit(
            AddProductState.error(
              dataState?.error ?? "An unknown error occurred",
            ),
          );
        }
      });
    });
  }
}
