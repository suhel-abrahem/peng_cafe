part of 'table_page_bloc.dart';

@freezed
class TablePageEvent with _$TablePageEvent {
  const factory TablePageEvent.loadTable({
    required int tableNumber,
    required int userId,
  }) = _LoadTable;

  const factory TablePageEvent.addProduct({required OrderItemModel item}) =
      _AddProduct;

  const factory TablePageEvent.setItemQuantity({
    required int itemId,
    required double quantity,
  }) = _SetItemQuantity;

  const factory TablePageEvent.deleteItem({required int itemId}) = _DeleteItem;

  const factory TablePageEvent.refreshItems() = _RefreshItems;
}
