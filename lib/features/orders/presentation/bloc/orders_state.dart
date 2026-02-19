part of 'orders_bloc.dart';

@freezed
abstract class OrdersState with _$OrdersState {
  const factory OrdersState.loading() = OrdersStateLoading;

  const factory OrdersState.loaded({required List<OrdersSection> sections}) =
      OrdersStateLoaded;
  const factory OrdersState.loadedWithNoData() = OrdersStateLoadedWithNoData;
  const factory OrdersState.error(String message) = OrdersStateError;
}
