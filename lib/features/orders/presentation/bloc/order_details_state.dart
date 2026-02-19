part of 'order_details_bloc.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState.initial() = _Initial;

  const factory OrderDetailsState.loading() = _Loading;

  const factory OrderDetailsState.loaded({
    required OrderEntity order,
    required List<OrderItemEntity> items,
  }) = _Loaded;
  const factory OrderDetailsState.loadedWithNoData() = _LoadedWithNoData;
  const factory OrderDetailsState.error(String message) = _Error;
}
