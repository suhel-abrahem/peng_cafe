part of 'orders_bloc.dart';

@freezed
abstract class OrdersEvent with _$OrdersEvent {
  const factory OrdersEvent.load({required DurationEnum duration}) = _Load;
  const factory OrdersEvent.refresh({required DurationEnum duration}) =
      _Refresh;
  
}
