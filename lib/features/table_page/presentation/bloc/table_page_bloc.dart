import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peng_cafe/core/enums/order_type_enum/order_type_enum.dart';
import 'package:peng_cafe/core/usecase/usecase.dart';
import 'package:peng_cafe/features/table_page/domain/usecases/add_item_usecase.dart';
import 'package:peng_cafe/features/table_page/domain/usecases/update_item_usecase.dart';

import '../../../../core/enums/tables_enum/table_type_enum.dart';
import '../../../../core/resource/data_state.dart';
import '../../data/models/order_item_model.dart';
import '../../data/models/order_model.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/entities/order_item_entity.dart';
import '../../domain/usecases/close_order_usecase.dart';
import '../../domain/usecases/delete_item_usecase.dart';
import '../../domain/usecases/get_or_create_order_usecase.dart';
import '../../domain/usecases/get_order_items_usecase.dart';

part 'table_page_event.dart';
part 'table_page_state.dart';
part 'table_page_bloc.freezed.dart';

class TablePageBloc extends Bloc<TablePageEvent, TablePageState> {
  final GetOrCreateOrderUsecase _getOrCreateOrder;
  final AddItemUsecase _addItem;
  final UpdateItemUsecase _updateItemQuantity;
  final GetOrderItemsUsecase _getOrderItems;
  final DeleteItemUsecase _deleteOrderItem;
  final CloseOrderUsecase _closeOrderUsecase;

  OrderEntity? _currentOrder;

  TablePageBloc(
    this._getOrCreateOrder,
    this._addItem,
    this._updateItemQuantity,
    this._getOrderItems,
    this._deleteOrderItem,
    this._closeOrderUsecase,
  ) : super(const TablePageState.initial()) {
    on<_LoadTable>(_onLoadTable);
    on<_AddProduct>(_onAddProduct);
    on<_RefreshItems>(_onRefreshItems);
    on<_SetItemQuantity>(_onSetItemQuantity);
    on<_Checkout>(_onCheckout);
  }

  // ================= LOAD TABLE =================

  Future<void> _onLoadTable(
    _LoadTable event,
    Emitter<TablePageState> emit,
  ) async {
    emit(const TablePageState.loading());

    final result = await _getOrCreateOrder.call(
      params: OrderModel(
        tableNumber: event.tableNumber,
        userId: event.userId,
        tableType: event.tableType,
        orderType: event.orderType,
        isEditing: event.isEditing,
      ),
    );
    print('Get or create order result: $result');
    if (result is DataSuccess && result.data != null) {
      _currentOrder = result.data;

      final itemsResult = await _getOrderItems.call(
        params: GetOrderItemsParams(
          orderId: event.isEditing == true
              ? (event.orderId ?? 0)
              : _currentOrder!.id,
          locale: event.locale,
        ),
      );
      print('Get order items result: ${itemsResult.data?.firstOrNull}');
      emit(
        TablePageState.loaded(
          order: _currentOrder!,
          items: itemsResult.data ?? [],
        ),
      );
    } else {
      emit(TablePageState.error(result.error ?? 'Failed to load table'));
    }
    print('LOAD TABLE → number=${event.tableNumber} type=${event.tableType}');
    print('ORDER ID → ${_currentOrder?.id}');
  }

  // ================= ADD PRODUCT =================

  Future<void> _onAddProduct(
    _AddProduct event,
    Emitter<TablePageState> emit,
  ) async {
    // print(
    //   'pef ADD PRODUCT → productId=${event.item.productId} quantity=${event.item.quantity}',
    // );
    if (_currentOrder == null) return;
    // print(
    //   "Adding product: ${event.item.productId} to order: ${_currentOrder!.id}",
    // );
    await _addItem.call(
      params: event.item.copyWith(
        orderId: _currentOrder?.id ?? event.item.orderId,
        quantity: 1,
        tableType: _currentOrder?.tableType ?? event.item.tableType,
        tableNumber: _currentOrder?.tableNumber ?? event.item.tableNumber,
      ),
    );

    add(TablePageEvent.refreshItems(locale: event.item.locale));
  }

  // ================= SET ITEM QUANTITY =================

  Future<void> _onSetItemQuantity(
    _SetItemQuantity event,
    Emitter<TablePageState> emit,
  ) async {
    final state = this.state;
    if (state is! _Loaded) return;
    print(
      ' bloc SET ITEM QUANTITY → itemId=${event.itemId} quantity=${event.quantity} orderId=${event.orderId} tableNumber=${event.tableNumber} tableType=${event.tableType}',
    );
    final item = state.items.firstWhere((e) => e.id == event.itemId);

    if (event.quantity <= 0) {
      await _deleteOrderItem.call(params: event.itemId);
    } else {
      await _updateItemQuantity.call(
        params: OrderItemModel(
          id: item.id,
          orderId: _currentOrder?.id ?? (event.orderId ?? 0),
          productId: item.productId,
          price: item.price,
          quantity: event.quantity,
          tableType: _currentOrder?.tableType ?? event.tableType,
          tableNumber: _currentOrder?.tableNumber ?? (event.tableNumber ?? 0),
          productType: item.productType,
        ),
      );
    }

    add(TablePageEvent.refreshItems(locale: event.locale));
  }

  // ================= REFRESH =================

  Future<void> _onRefreshItems(
    _RefreshItems event,
    Emitter<TablePageState> emit,
  ) async {
    if (_currentOrder == null) return;

    final itemsResult = await _getOrderItems.call(
      params: GetOrderItemsParams(
        orderId: _currentOrder!.id,
        locale: event.locale ?? "ar",
      ),
    );

    emit(
      TablePageState.loaded(
        order: _currentOrder!,
        items: itemsResult.data ?? [],
      ),
    );
  }

  Future<void> _onCheckout(
    _Checkout event,
    Emitter<TablePageState> emit,
  ) async {
    if (_currentOrder == null) return;

    final currentState = state;
    if (currentState is! _Loaded) return;

    emit(const TablePageState.loading());

    final result = await _closeOrderUsecase.call(
      params: CloseOrderParams(
        orderId: _currentOrder!.id,
        paidAmount: event.paidAmount,
        remaining: event.remaining,
      ),
    );

    if (result is DataSuccess) {
      emit(
        TablePageState.checkoutSuccess(
          order: _currentOrder!,
          items: currentState.items,
          paidAmount: event.paidAmount,
          remaining: event.remaining,
        ),
      );
    } else {
      emit(TablePageState.error(result.error ?? 'Checkout failed'));
    }
  }
}
