part of 'delete_order_by_id_bloc.dart';

@freezed
class DeleteOrderByIdEvent with _$DeleteOrderByIdEvent {
  const factory DeleteOrderByIdEvent.started() = _Started;
  const factory DeleteOrderByIdEvent.delete(int orderId) = _Delete;
}
