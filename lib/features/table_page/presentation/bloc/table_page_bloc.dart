import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peng_cafe/core/usecase/usecase.dart';
import 'package:peng_cafe/features/table_page/domain/usecases/add_item_usecase.dart';
import 'package:peng_cafe/features/table_page/domain/usecases/update_item_usecase.dart';

import '../../../../core/enums/tables_enum/table_type_enum.dart';
import '../../../../core/resource/data_state.dart';
import '../../data/models/order_item_model.dart';
import '../../data/models/order_model.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/entities/order_item_entity.dart';
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

  OrderEntity? _currentOrder;

  TablePageBloc(
    this._getOrCreateOrder,
    this._addItem,
    this._updateItemQuantity,
    this._getOrderItems,
    this._deleteOrderItem,
  ) : super(const TablePageState.initial()) {
    on<_LoadTable>(_onLoadTable);
    on<_AddProduct>(_onAddProduct);
    on<_RefreshItems>(_onRefreshItems);
    on<_SetItemQuantity>(_onSetItemQuantity);
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
      ),
    );

    if (result is DataSuccess && result.data != null) {
      _currentOrder = result.data;

      final itemsResult = await _getOrderItems.call(
        params: GetOrderItemsParams(
          orderId: _currentOrder!.id,
          locale: event.locale,
        ),
      );

      emit(
        TablePageState.loaded(
          order: _currentOrder!,
          items: itemsResult.data ?? [],
        ),
      );
    } else {
      emit(TablePageState.error(result.error ?? 'Failed to load table'));
    }
  }

  // ================= ADD PRODUCT =================

  Future<void> _onAddProduct(
    _AddProduct event,
    Emitter<TablePageState> emit,
  ) async {
    if (_currentOrder == null) return;

    await _addItem.call(
      params: event.item.copyWith(
        orderId: _currentOrder!.id,
        quantity: 1,
        tableType: _currentOrder!.tableType,
        tableNumber: _currentOrder!.tableNumber,
      ),
    );

    add(TablePageEvent.refreshItems(locale: event.item.locale));
  }

  // ================= SET ITEM QUANTITY =================

  Future<void> _onSetItemQuantity(
    _SetItemQuantity event,
    Emitter<TablePageState> emit,
  ) async {
    if (_currentOrder == null) return;

    final state = this.state;
    if (state is! _Loaded) return;

    final item = state.items.firstWhere((e) => e.id == event.itemId);

    if (event.quantity <= 0) {
      await _deleteOrderItem.call(params: event.itemId);
    } else {
      await _updateItemQuantity.call(
        params: OrderItemModel(
          id: item.id,
          orderId: _currentOrder!.id,
          productId: item.productId,
          price: item.price,
          quantity: event.quantity,
          tableType: _currentOrder!.tableType,
          tableNumber: _currentOrder!.tableNumber,
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
}
