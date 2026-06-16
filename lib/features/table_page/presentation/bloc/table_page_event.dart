part of 'table_page_bloc.dart';

@freezed
class TablePageEvent with _$TablePageEvent {
  const factory TablePageEvent.loadTable({
    required int tableNumber,
    required TableTypeEnum tableType,
    required int userId,
    required String locale,
    OrderTypeEnum? orderType,
    int? orderId,
    bool? isEditing,
  }) = _LoadTable;

  const factory TablePageEvent.addProduct({required OrderItemModel item}) =
      _AddProduct;

  const factory TablePageEvent.setItemQuantity({
    required int itemId,
    required double quantity,
    required TableTypeEnum tableType,
    int? tableNumber,
    required String locale,
    int? orderId,
  }) = _SetItemQuantity;

  const factory TablePageEvent.deleteItem({
    required int itemId,
    required String locale,
    int? orderId,
  }) = _DeleteItem;

  const factory TablePageEvent.refreshItems({required String? locale}) =
      _RefreshItems;
  const factory TablePageEvent.checkout({
    required double paidAmount,
    required double remaining,
    required String? clientName,
  }) = _Checkout;
}
