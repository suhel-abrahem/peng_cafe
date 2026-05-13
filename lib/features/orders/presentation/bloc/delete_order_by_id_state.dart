part of 'delete_order_by_id_bloc.dart';

@freezed
class DeleteOrderByIdState with _$DeleteOrderByIdState {
  const factory DeleteOrderByIdState.initial() = _Initial;
  const factory DeleteOrderByIdState.loading() = _Loading;
  const factory DeleteOrderByIdState.deleted() = _Deleted;
  const factory DeleteOrderByIdState.error(String message) = _Error;
}
