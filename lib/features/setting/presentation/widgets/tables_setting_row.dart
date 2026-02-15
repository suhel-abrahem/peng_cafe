import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peng_cafe/core/constant/font_constants.dart';
import 'package:peng_cafe/core/enums/tables_enum/table_type_enum.dart';
import 'package:peng_cafe/core/resource/custom_widget/custom_input_field/custom_input_field.dart';

import '../../domain/entities/tables_setting_entity/tables_quantity_entity.dart';
import 'dart:ui' as ui;

class TablesSettingRow extends StatefulWidget {
  final TablesQuantityEntity tableType;
  final ValueChanged<int> onEdit;
  final bool canEdit;
  final ValueChanged<bool> onActivationChanged;
  final String? Function(String?)? validator;

  const TablesSettingRow({
    super.key,
    required this.tableType,
    required this.onEdit,
    required this.onActivationChanged,
    required this.canEdit,
    this.validator,
  });

  @override
  State<TablesSettingRow> createState() => _TablesSettingRowState();
}

class _TablesSettingRowState extends State<TablesSettingRow> {
  String textInput = "";
  @override
  void initState() {
    textInput = widget.tableType.quantity.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.canEdit || widget.tableType.isActive,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.tableType.tableName.quantityLocaleKey.tr(),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontFamily: FontConstants.fontFamily(context.locale),
            ),
          ),

          CustomInputField(
            textDirection: ui.TextDirection.ltr,
            width: 150,
            enabled: widget.canEdit && widget.tableType.isActive,
            initialValue: textInput,
            validator: widget.tableType.isActive ? widget.validator : null,
            onChanged: (v) => widget.onEdit(int.tryParse(v) ?? 0),
          ),

          if (widget.canEdit)
            Checkbox(
              value: widget.tableType.isActive,
              onChanged: (v) => widget.onActivationChanged(v ?? false),
            ),
        ],
      ),
    );
  }
}
