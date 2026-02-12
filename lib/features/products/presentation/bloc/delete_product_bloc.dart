import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/resource/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/delete_all_product_except_excluding_usecase.dart';
import '../../domain/usecases/delete_all_product_usecase.dart';
import '../../domain/usecases/delete_selected_products_usecase.dart';

part 'delete_product_event.dart';
part 'delete_product_state.dart';
part 'delete_product_bloc.freezed.dart';

class DeleteProductBloc extends Bloc<DeleteProductEvent, DeleteProductState> {
  final DeleteSelectedProductsUsecase _deleteSelectedProductsUsecase;
  final DeleteAllProductUsecase _deleteAllProductsUsecase;
  final DeleteAllProductExceptExcludingUsecase
  _deleteAllProductExceptExcludingUsecase;

  DeleteProductBloc(
    this._deleteSelectedProductsUsecase,
    this._deleteAllProductsUsecase,
    this._deleteAllProductExceptExcludingUsecase,
  ) : super(const DeleteProductState.initial()) {
    on<DeleteProductEventStarted>(
      (_, emit) => emit(const DeleteProductState.initial()),
    );

    on<DeleteProductEventCanDelete>(
      (_, emit) => emit(const DeleteProductState.canDelete()),
    );

    on<DeleteProductEventDeleteAll>(_onDeleteAll);
    on<DeleteProductEventDeleteSelected>(_onDeleteSelected);
    on<DeleteProductEventDeleteAllExceptExcluded>(_onDeleteAllExceptExcluded);
  }

  Future<void> _onDeleteAll(
    DeleteProductEventDeleteAll event,
    Emitter<DeleteProductState> emit,
  ) async {
    await _executeDelete(
      emit,
      () => _deleteAllProductsUsecase.call(params: NoParams()),
    );
  }

  Future<void> _onDeleteSelected(
    DeleteProductEventDeleteSelected event,
    Emitter<DeleteProductState> emit,
  ) async {
    if (event.ids.isEmpty) {
      emit(const DeleteProductState.error("No products selected"));
      return;
    }

    await _executeDelete(
      emit,
      () => _deleteSelectedProductsUsecase.call(params: event.ids),
    );
  }

  Future<void> _onDeleteAllExceptExcluded(
    DeleteProductEventDeleteAllExceptExcluded event,
    Emitter<DeleteProductState> emit,
  ) async {
    await _executeDelete(
      emit,
      () => _deleteAllProductExceptExcludingUsecase.call(
        params: event.excludedIds,
      ),
    );
  }

  Future<void> _executeDelete(
    Emitter<DeleteProductState> emit,
    Future<DataState<void>?> Function() action,
  ) async {
    emit(const DeleteProductState.loading());

    final dataState = await action();

    if (dataState is DataSuccess) {
      emit(const DeleteProductState.success());
    } else {
      emit(
        DeleteProductState.error(
          dataState?.error ?? "An unknown error occurred",
        ),
      );
    }
  }
}
