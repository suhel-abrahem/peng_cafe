import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/util/validator/validator.dart';
import 'package:peng_cafe/features/setting/data/models/tables_setting/tables_types_model.dart';
import 'package:peng_cafe/features/setting/presentation/bloc/tables_types_bloc.dart';

import '../../../../core/constant/font_constants.dart';
import '../../../../core/enums/tables_enum/table_type_enum.dart';
import '../../../../generated/locale_keys.g.dart';
import 'tables_setting_row.dart';

class TablesSettingWidget extends StatefulWidget {
  const TablesSettingWidget({super.key});

  @override
  State<TablesSettingWidget> createState() => _TablesSettingWidgetState();
}

class _TablesSettingWidgetState extends State<TablesSettingWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TablesTypesBloc()..add(const TablesTypesEvent.load()),
      child: BlocBuilder<TablesTypesBloc, TablesTypesState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: state.isEditing ? 600.w : 450.w,
            // height: (state.tablesTypes.tablesTypes.length * 100.h) + 100.h,
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 40.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.settingsPage_tablesSettings_title.tr(),
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                fontFamily: FontConstants.fontFamily(
                                  context.locale,
                                ),
                              ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => context.read<TablesTypesBloc>().add(
                            const TablesTypesEvent.toggleEdit(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ...state.tablesTypes.tablesTypes.map(
                    (table) => TablesSettingRow(
                      validator: (value) {
                        if (!RegExp(
                          Validator.numberRegex,
                        ).hasMatch(value ?? "")) {
                          return LocaleKeys.validation_quantity.tr();
                        }
                        return null;
                      },
                      tableType: table,
                      canEdit: state.isEditing,
                      onEdit: (value) => context.read<TablesTypesBloc>().add(
                        TablesTypesEvent.updateQuantity(
                          tableName: table.tableName,
                          quantity: value,
                        ),
                      ),
                      onActivationChanged: (status) =>
                          context.read<TablesTypesBloc>().add(
                            TablesTypesEvent.toggleActivation(
                              tableName: table.tableName,
                              isActive: status,
                            ),
                          ),
                    ),
                  ),

                  if (state.isEditing)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: ElevatedButton(
                            onPressed: _formKey.currentState?.validate() == true
                                ? () => context.read<TablesTypesBloc>().add(
                                    const TablesTypesEvent.save(),
                                  )
                                : null,
                            child: Text(
                              LocaleKeys.settingsPage_save.tr(),
                              style: TextStyle(
                                fontFamily: FontConstants.fontFamily(
                                  context.locale,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200.w,
                          child: ElevatedButton(
                            onPressed: () => context
                                .read<TablesTypesBloc>()
                                .add(const TablesTypesEvent.toggleEdit()),
                            child: Text(
                              LocaleKeys.settingsPage_cancel.tr(),
                              style: TextStyle(
                                fontFamily: FontConstants.fontFamily(
                                  context.locale,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ).asGlass(
            tintColor: Theme.of(context).scaffoldBackgroundColor,
            blurX: 10,
            blurY: 10,
            clipBorderRadius: BorderRadius.circular(20.r),
            border: Theme.of(context).defaultBorderSide,
          );
        },
      ),
    );
  }
}
