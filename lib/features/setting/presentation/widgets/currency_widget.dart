import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/app/app_preferences.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/resource/custom_widget/snake_bar_widget/snake_bar_widget.dart';

import '../../../../core/constant/font_constants.dart';
import '../../../../core/enums/psition_enum.dart';
import '../../../../core/resource/custom_widget/custom_input_field/custom_input_field.dart';
import '../../../../generated/locale_keys.g.dart';

class CurrencyWidget extends StatefulWidget {
  const CurrencyWidget({super.key});

  @override
  State<CurrencyWidget> createState() => _CurrencyWidgetState();
}

class _CurrencyWidgetState extends State<CurrencyWidget> {
  double? oneHundredDollarsEqualsInIqd;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isEditing = false;
  @override
  void initState() {
    oneHundredDollarsEqualsInIqd = getItInstance<AppPreferences>()
        .getUsdPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child:
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 400.w,
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys
                          .settingsPage_oneHundredDollarsEqualsInIqdSetting_title
                          .tr(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(
                      width: 30.w,
                      height: 30.h,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isEditing = !isEditing;
                          });
                        },
                        icon: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Icon(isEditing ? Icons.check : Icons.edit),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: CustomInputField(
                    width: 150.w,
                    height: 60.h,
                    haveOuterLabel: true,
                    outerLabelPosition: Position.upper,
                    outerLabelPadding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 12.w,
                    ),
                    outerLabel: LocaleKeys
                        .settingsPage_oneHundredDollarsEqualsInIqdSetting_priceFoeOneHundredDollars
                        .tr(),
                    initialValue:
                        oneHundredDollarsEqualsInIqd?.toStringAsFixed(2) ?? "",
                    onChanged: (value) async {
                      setState(() {
                        oneHundredDollarsEqualsInIqd = double.tryParse(value);
                      });
                    },
                    errorStyle: TextStyle(fontSize: 14.sp),
                    validator: (validatorValue) {
                      final value = validatorValue.toString().trim();
                      if (value.isEmpty) {
                        return LocaleKeys.validation_requiredField.tr();
                      }
                      if (double.tryParse(value) == null) {
                        return LocaleKeys.validation_requiredField.tr();
                      }
                      if ((double.tryParse(value) ?? 0) <= 0) {
                        return LocaleKeys
                            .settingsPage_oneHundredDollarsEqualsInIqdSetting_oneHundredDollarsEqualsInIqdMustBeGreaterThanZero
                            .tr();
                      }
                      return null;
                    },
                  ),
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 400),
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
                                          .setUsdPrice(
                                            double.tryParse(
                                                  oneHundredDollarsEqualsInIqd
                                                          ?.toStringAsFixed(
                                                            2,
                                                          ) ??
                                                      "",
                                                ) ??
                                                0.0,
                                          );
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
                                fontFamily: FontConstants.fontFamily(
                                  context.locale,
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              LocaleKeys.common_cancel.tr(),
                              style: TextStyle(
                                fontFamily: FontConstants.fontFamily(
                                  context.locale,
                                ),
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
            border: Theme.of(context).defaultBorderSide,
          ),
    );
  }
}
