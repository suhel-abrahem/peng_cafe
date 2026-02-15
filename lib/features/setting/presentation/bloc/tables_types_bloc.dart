import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peng_cafe/config/app/app_preferences.dart';
import 'package:peng_cafe/core/enums/tables_enum/table_type_enum.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/features/setting/domain/entities/tables_setting_entity/tables_quantity_entity.dart';

import '../../data/models/tables_setting/tables_types_model.dart';

part 'tables_types_event.dart';
part 'tables_types_state.dart';
part 'tables_types_bloc.freezed.dart';

class TablesTypesBloc extends Bloc<TablesTypesEvent, TablesTypesState> {
  TablesTypesBloc() : super(const TablesTypesState()) {
    on<TablesTypesLoad>(_onLoad);
    on<TablesTypesToggleEdit>(_onToggleEdit);
    on<TablesTypesUpdateQuantity>(_onUpdateQuantity);
    on<TablesTypesToggleActivation>(_onToggleActivation);
    on<TablesTypesSave>(_onSave);
  }

  void _onLoad(TablesTypesLoad event, Emitter<TablesTypesState> emit) {
    emit(state.copyWith(isLoading: true));

    final local = getItInstance<AppPreferences>().getTablesTypesLocally();

    final filtered = state.isEditing
        ? local.tablesTypes
        : local.tablesTypes.where((e) => e.isActive).toList();

    emit(
      state.copyWith(
        tablesTypes: local.copyWith(tablesTypes: filtered),
        isLoading: false,
      ),
    );
  }

  void _onToggleEdit(
    TablesTypesToggleEdit event,
    Emitter<TablesTypesState> emit,
  ) {
    emit(state.copyWith(isEditing: !state.isEditing));
    add(const TablesTypesEvent.load());
  }

  void _onUpdateQuantity(
    TablesTypesUpdateQuantity event,
    Emitter<TablesTypesState> emit,
  ) {
    final updated = state.tablesTypes.tablesTypes.map((e) {
      if (e.tableName == event.tableName) {
        return e.copyWith(quantity: event.quantity);
      }
      return e;
    }).toList();

    emit(
      state.copyWith(
        tablesTypes: state.tablesTypes.copyWith(tablesTypes: updated),
      ),
    );
  }

  void _onToggleActivation(
    TablesTypesToggleActivation event,
    Emitter<TablesTypesState> emit,
  ) {
    final updated = state.tablesTypes.tablesTypes.map((e) {
      if (e.tableName == event.tableName) {
        return e.copyWith(isActive: event.isActive);
      }
      return e;
    }).toList();

    emit(
      state.copyWith(
        tablesTypes: state.tablesTypes.copyWith(tablesTypes: updated),
      ),
    );
  }

  Future<void> _onSave(
    TablesTypesSave event,
    Emitter<TablesTypesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    await getItInstance<AppPreferences>().setTablesTypesLocally(
      state.tablesTypes,
    );

    emit(state.copyWith(isLoading: false, isEditing: false));

    add(const TablesTypesEvent.load());
  }
}
