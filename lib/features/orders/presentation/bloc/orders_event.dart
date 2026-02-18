part of 'orders_bloc.dart';

@freezed
class OrdersEvent with _$OrdersEvent {
  const factory OrdersEvent.load() = _Load;
  const factory OrdersEvent.refresh() = _Refresh;
}
