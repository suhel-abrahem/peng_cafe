part of 'orders_bloc.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.loading() = _Loading;

  const factory OrdersState.loaded(List<OrdersSection> sections) = _Loaded;

  const factory OrdersState.error(String message) = _Error;
}
