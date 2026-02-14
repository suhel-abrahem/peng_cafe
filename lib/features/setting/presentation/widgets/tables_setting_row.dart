import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peng_cafe/core/constant/font_constants.dart';
import 'package:peng_cafe/core/resource/custom_widget/custom_input_field/custom_input_field.dart';

class TablesSettingRow extends StatelessWidget {
  final String title;

  final int quantity;
  final ValueChanged<int> onEdit;
  final ValueChanged<bool> onActivationChanged;
  final bool isActive;
  final bool canEdit;
  final String? Function(String?)? validator;
  const TablesSettingRow({
    super.key,
    required this.title,
    required this.quantity,
    required this.onEdit,
    required this.onActivationChanged,

    required this.isActive,
    required this.canEdit,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: canEdit ? true : isActive,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontFamily: FontConstants.fontFamily(context.locale),
            ),
          ),
          CustomInputField(
            width: 150.w,
            height: 60.h,
            errorStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: 12.sp,
              fontFamily: FontConstants.fontFamily(context.locale),
              color: Colors.red,
            ),
            fillColor: Colors.transparent,
            enabled: isActive,
            initialValue: quantity.toString(),
            onChanged: (value) => onEdit(int.tryParse(value) ?? quantity),
            validator: (value) => isActive
                ? validator != null
                      ? validator!(value)
                      : null
                : null,
          ),
          Visibility(
            visible: canEdit,
            child: Checkbox(
              value: isActive,
              onChanged: (newStatus) => onActivationChanged(newStatus ?? false),
            ),
          ),
        ],
      ),
    );
  }
}
