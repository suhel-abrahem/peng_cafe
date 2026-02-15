part of 'table_page_bloc.dart';

@freezed
class TablePageState with _$TablePageState {
  const factory TablePageState.initial() = _Initial;
  const factory TablePageState.loading() = _Loading;

  const factory TablePageState.loaded({
    required OrderEntity order,
    required List<OrderItemEntity> items,
  }) = _Loaded;

  const factory TablePageState.error(String message) = _Error;
}
