import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/resource/data_state.dart';
import '../../../table_page/domain/entities/order_entity.dart';
import '../../../table_page/domain/entities/order_item_entity.dart';
import '../../domain/usecases/get_order_details_usecase.dart';

part 'order_details_event.dart';
part 'order_details_state.dart';
part 'order_details_bloc.freezed.dart';

class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  final GetOrderDetailsUsecase usecase;

  OrderDetailsBloc(this.usecase) : super(const OrderDetailsState.loading()) {
    on<_Load>(_onLoad);
  }

  Future<void> _onLoad(
    OrderDetailsEvent event,
    Emitter<OrderDetailsState> emit,
  ) async {
    emit(const OrderDetailsState.loading());

    final result = await usecase.call(
      params: GetOrderDetailsParams(
        orderId: event.orderId,
        locale: event.locale,
      ),
    );

    if (result is DataSuccess && result.data != null) {
      emit(
        OrderDetailsState.loaded(
          order: result.data!.$1,
          items: result.data!.$2,
        ),
      );
    } else {
      emit(
        OrderDetailsState.error(result.error ?? 'Error loading order details'),
      );
    }
  }
}
