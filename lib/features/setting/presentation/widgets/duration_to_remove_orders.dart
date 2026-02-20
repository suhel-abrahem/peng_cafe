import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/enums/duration_enum.dart';
import 'package:peng_cafe/core/enums/psition_enum.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/resource/custom_widget/dropdown/drop_down_with_label.dart';
import 'package:peng_cafe/core/resource/custom_widget/snake_bar_widget/snake_bar_widget.dart';
import 'package:peng_cafe/generated/locale_keys.g.dart';

import '../../../../config/app/app_preferences.dart';
import '../../../../core/constant/font_constants.dart';

class DurationToRemoveOrdersWidget extends StatefulWidget {
  const DurationToRemoveOrdersWidget({super.key});

  @override
  State<DurationToRemoveOrdersWidget> createState() =>
      _DurationToRemoveOrdersWidgetState();
}

class _DurationToRemoveOrdersWidgetState
    extends State<DurationToRemoveOrdersWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DurationEnum? selectedDuration = DurationEnum.quarterly;
  bool isEditing = false;
  @override
  void initState() {
    selectedDuration = getItInstance<AppPreferences>()
        .getDurationToDeleteOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: 400.w,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.settingsPage_durationToRemoveOrdersSetting_title
                    .tr(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => setState(() => isEditing = !isEditing),
              ),
            ],
          ),
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: DropDownWithLabel(
              items: DurationEnum.values,
              onChange: (newDuration) {
                selectedDuration = newDuration;
              },
              stringConverter: (DurationEnum duration) {
                return duration.displayName.tr();
              },
              validator: (value) {
                if (value == null) {
                  return LocaleKeys
                      .settingsPage_durationToRemoveOrdersSetting_durationAreRequired
                      .tr();
                }
                return null;
              },
              dropDownWidth: 200.w,
              dropDownHeight: 60.h,
              isLoading: false,
              readOnly: isEditing == false,
              value: selectedDuration,
              label: LocaleKeys.settingsPage_durationToRemoveOrdersSetting_title
                  .tr(),
              labelPosition: Position.upper,
              labelPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 8.h,
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: Visibility(
              key: ValueKey(isEditing),
              visible: isEditing,
              child: Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _formKey.currentState?.validate() == true
                          ? () async {
                              try {
                                await getItInstance<AppPreferences>()
                                    .setDurationToDeleteOrders(
                                      selectedDuration ??
                                          DurationEnum.quarterly,
                                    );
                                if (context.mounted) {
                                  showMessage(
                                    message: LocaleKeys.common_success.tr(),
                                    context: context,
                                  );
                                }
                                setState(() {
                                  isEditing = false;
                                });
                              } catch (e) {
                                if (context.mounted) {
                                  showMessage(
                                    message: LocaleKeys.common_error.tr(),
                                    context: context,
                                  );
                                }
                              }
                            }
                          : null,
                      child: Text(
                        LocaleKeys.settingsPage_save.tr(),
                        style: TextStyle(
                          fontFamily: FontConstants.fontFamily(context.locale),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() => isEditing = false),
                      child: Text(
                        LocaleKeys.settingsPage_cancel.tr(),
                        style: TextStyle(
                          fontFamily: FontConstants.fontFamily(context.locale),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ).asGlass(
      tintColor: Theme.of(context).scaffoldBackgroundColor,
      clipBorderRadius: BorderRadius.circular(20.r),
      blurX: 10,
      blurY: 10,
      border: Theme.of(context).defaultBorderSide,
    );
  }
}
