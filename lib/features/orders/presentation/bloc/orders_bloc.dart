import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peng_cafe/core/DB/app_database.dart';
import '../../../../core/DB/mappers/orders_mapper.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/orders_section_model.dart';
import '../../domain/usecases/get_orders_summary_usecas.dart';

part 'orders_event.dart';
part 'orders_state.dart';
part 'orders_bloc.freezed.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetOrdersSummaryUsecase getOrdersSummary;

  OrdersBloc(this.getOrdersSummary) : super(const OrdersState.loading()) {
    on<_Load>(_onLoad);
    on<_Refresh>(_onLoad);
  }

  Future<void> _onLoad(OrdersEvent event, Emitter<OrdersState> emit) async {
    emit(const OrdersState.loading());

    try {
      final sections = await getOrdersSummary.call(params: NoParams());

      emit(OrdersState.loaded(sections));
    } catch (e) {
      emit(OrdersState.error(e.toString()));
    }
  }
}
