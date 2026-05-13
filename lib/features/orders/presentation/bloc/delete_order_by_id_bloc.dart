import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peng_cafe/core/resource/data_state.dart';
import 'package:peng_cafe/features/orders/domain/usecases/delete_order_by_id_usecase.dart';

part 'delete_order_by_id_event.dart';
part 'delete_order_by_id_state.dart';
part 'delete_order_by_id_bloc.freezed.dart';

class DeleteOrderByIdBloc
    extends Bloc<DeleteOrderByIdEvent, DeleteOrderByIdState> {
  final DeleteOrderByIdUsecase _deleteOrderByIdUsecase;
  DeleteOrderByIdBloc(this._deleteOrderByIdUsecase) : super(_Initial()) {
    on<_Started>((event, emit) {
      emit(_Initial());
    });
    on<_Delete>((event, emit) async {
      emit(_Loading());
      final response = await _deleteOrderByIdUsecase.call(
        params: event.orderId,
      );
      if (response is DataSuccess) {
        emit(_Deleted());
      } else {
        emit(_Error(response.error ?? "something wrong"));
      }
    });
  }
}
