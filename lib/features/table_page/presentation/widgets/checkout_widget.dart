import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:go_router/go_router.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/constant/font_constants.dart';
import 'package:peng_cafe/core/enums/currency_enum.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/resource/custom_widget/custom_input_field/custom_input_field.dart';
import 'package:peng_cafe/core/resource/custom_widget/dropdown/drop_down_with_label.dart';
import 'package:peng_cafe/core/util/helper/helper.dart';
import 'package:peng_cafe/generated/locale_keys.g.dart';

import '../../../../config/app/app_preferences.dart';
import '../../../../core/util/validator/validator.dart';
import '../../data/models/checkout_model.dart';

class CheckoutWidget extends StatefulWidget {
  final double totalAmount;
  final ValueChanged<CheckoutResult> onCheckout;
  const CheckoutWidget({
    super.key,
    required this.totalAmount,
    required this.onCheckout,
  });

  @override
  State<CheckoutWidget> createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  double? amountPaid;
  String clientName = "";
  CurrencyEnum? selectedCurrency = CurrencyEnum.iqd;
  double usdToIqdRate = 1450;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String remainingAmountToBePaid() {
    if (amountPaid == null) return "0.00";
    double paidInIqd = selectedCurrency == CurrencyEnum.usd
        ? (amountPaid ?? 0) * usdToIqdRate
        : (amountPaid ?? 0);
    double remaining = paidInIqd - widget.totalAmount;
    return remaining > 0 ? Helper.formatPrice(remaining) : "0.00";
  }

  @override
  void initState() {
    amountPaid = widget.totalAmount;
    usdToIqdRate = getItInstance<AppPreferences>().getUsdPrice() / 100;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child:
            Container(
              width: 800.w,

              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      LocaleKeys.tablePage_totalAmount.tr(
                        namedArgs: {
                          'amount': Helper.formatPrice(widget.totalAmount),
                        },
                      ),
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Row(
                        children: [
                          CustomInputField(
                            errorStyle: TextStyle(fontSize: 14.sp),
                            label: LocaleKeys.tablePage_givenPrice.tr(),
                            width: 200.w,
                            height: 60.h,
                            initialValue: amountPaid?.toStringAsFixed(2),
                            onChanged: (value) => setState(() {
                              amountPaid = double.tryParse(value);
                            }),
                            onSubmitted: (value) {
                              setState(() {
                                amountPaid = double.tryParse(value);
                              });
                            },
                            validator: (value) {
                              double? parsedValue = double.tryParse(
                                value.toString().trim(),
                              );
                              parsedValue ??= 0.0;
                              if (selectedCurrency == CurrencyEnum.usd) {
                                parsedValue *=
                                    usdToIqdRate; // Convert to IQD for validation
                              }
                              if (!RegExp(
                                Validator.numberRegex,
                              ).hasMatch(value.toString().trim())) {
                                return LocaleKeys.validation_requiredField.tr();
                              }
                              if (double.tryParse(value.toString().trim()) ==
                                  null) {
                                return LocaleKeys.validation_requiredField.tr();
                              }
                              if (parsedValue < widget.totalAmount) {
                                return LocaleKeys
                                    .tablePage_theGivenPriceIsLessThanTheTotalCostPrice
                                    .tr();
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: DropDownWithLabel(
                              items: CurrencyEnum.values,
                              onChange: (newCurrency) {
                                setState(() {
                                  selectedCurrency = newCurrency;
                                });
                              },
                              stringConverter: (selected) {
                                switch (selected) {
                                  case CurrencyEnum.iqd:
                                    return "IQD";
                                  case CurrencyEnum.usd:
                                    return "USD";
                                }
                              },
                              dropDownWidth: 120.w,
                              dropDownHeight: 60.h,
                              isLoading: false,
                              value: selectedCurrency,
                            ),
                          ),
                          CustomInputField(
                            errorStyle: TextStyle(fontSize: 14.sp),
                            label: LocaleKeys.tablePage_clientName.tr(),
                            width: 200.w,
                            height: 60.h,
                            isRequired: false,
                            initialValue: clientName,
                            onChanged: (value) {
                              clientName = value;
                            },
                            onSubmitted: (value) {
                              clientName = value;
                            },
                            validator: (value) {
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),

                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 400),
                      child: Visibility(
                        key: ValueKey(amountPaid),
                        visible: selectedCurrency == CurrencyEnum.usd,

                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleKeys.tablePage_each100DollarsEqualsInIqd
                                    .tr(
                                      namedArgs: {
                                        'amount': usdToIqdRate.toStringAsFixed(
                                          2,
                                        ),
                                      },
                                    ),
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(
                                      fontFamily: FontConstants.fontFamily(
                                        context.locale,
                                      ),
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.h),
                                child: AnimatedSwitcher(
                                  duration: Duration(milliseconds: 400),
                                  child: Text(
                                    key: ValueKey(amountPaid),
                                    "${LocaleKeys.tablePage_givenPrice.tr()}: ${Helper.formatPrice(((amountPaid) ?? 0) * usdToIqdRate)} IQD",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          fontFamily: FontConstants.fontFamily(
                                            context.locale,
                                          ),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "${LocaleKeys.tablePage_theRemainingAmountToBeReturned.tr()}: ${remainingAmountToBePaid()} IQD",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontFamily: FontConstants.fontFamily(context.locale),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: _formKey.currentState?.validate() == true
                                ? () {
                                    final paid = amountPaid ?? 0;

                                    final paidInIqd =
                                        selectedCurrency == CurrencyEnum.usd
                                        ? paid * usdToIqdRate
                                        : paid;
                                    context.pop();
                                    final remaining =
                                        paidInIqd - widget.totalAmount;
                                    widget.onCheckout(
                                      CheckoutResult(
                                        paidAmount: paid,
                                        clientName: clientName,
                                        paidInIqd: paidInIqd,
                                        remaining: remaining,
                                      ),
                                    );
                                  }
                                : null,
                            child: Text(
                              LocaleKeys.tablePage_checkOut.tr(),
                              style: TextStyle(
                                fontFamily: FontConstants.fontFamily(
                                  context.locale,
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
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
                  ],
                ),
              ),
            ).asGlass(
              tintColor: Theme.of(context).scaffoldBackgroundColor,
              clipBorderRadius: BorderRadius.circular(20),
              border: Theme.of(context).defaultBorderSide,
              blurX: 10,
              blurY: 10,
            ),
      ),
    );
  }
}
