part of 'order_details_bloc.dart';

@freezed
abstract class OrderDetailsEvent with _$OrderDetailsEvent {
  const factory OrderDetailsEvent.load({
    required int orderId,
    required String locale,
  }) = _Load;

  const factory OrderDetailsEvent.refresh({
    required int orderId,
    required String locale,
  }) = _Refresh;
}
