import 'package:drift/drift.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/route/routes_manager.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/constant/font_constants.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/resource/custom_widget/custom_input_field/custom_input_field.dart';
import 'package:peng_cafe/features/table_page/presentation/bloc/table_page_bloc.dart';
import 'package:peng_cafe/generated/locale_keys.g.dart';

import '../../../../core/enums/order_type_enum/order_type_enum.dart';
import '../../../../core/enums/tables_enum/table_type_enum.dart';
import '../../../../core/resource/custom_widget/snake_bar_widget/snake_bar_widget.dart';

class WithdrawWidget extends StatelessWidget {
  const WithdrawWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String amount = '';
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child:
              Container(
                height: 200.h,
                width: 600.w,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: ListView(
                  children: [
                    CustomInputField(
                      width: 300.w,
                      height: 60.h,
                      hintText: "25,000",
                      initialValue: amount,
                      label: LocaleKeys.ordersPage_withdraw.tr(),
                      onChanged: (value) {
                        amount = value;
                      },
                      validator: (value) {
                        if (value == null || value.toString().trim().isEmpty) {
                          return LocaleKeys.validation_requiredField.tr();
                        }
                        if (double.tryParse(value) == null) {
                          return LocaleKeys.validation_price.tr();
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.h),
                      child: SizedBox(
                        width: 300.w,
                        child: BlocProvider(
                          create: (context) => getItInstance<TablePageBloc>(),
                          child: BlocListener<TablePageBloc, TablePageState>(
                            listener: (context, state) {
                              print("im in listener $state");
                              state.maybeWhen(
                                orElse: () {},
                                loaded: (order, items) {
                                  context.read<TablePageBloc>().add(
                                    TablePageEvent.checkout(
                                      paidAmount: double.parse(amount),
                                      remaining: 0,
                                    ),
                                  );
                                },
                              );
                            },
                            child: Builder(
                              builder: (context) {
                                return ElevatedButton(
                                  onPressed: () {
                                    if (double.tryParse(amount) == null) {
                                      showMessage(
                                        message: LocaleKeys.validation_price
                                            .tr(),
                                        context: context,
                                      );
                                      return;
                                    }
                                    context.read<TablePageBloc>().add(
                                      TablePageEvent.loadTable(
                                        tableNumber: 1,
                                        tableType: TableTypeEnum.cafe,
                                        orderType: OrderTypeEnum.withdrawal,
                                        userId: 0,
                                        locale: "ar",
                                      ),
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    LocaleKeys.ordersPage_withdraw.tr(),
                                    style: TextStyle(
                                      fontFamily: FontConstants.fontFamily(
                                        context.locale,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
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
                blurX: 10,
                blurY: 10,
              ),
        ),
      ),
    );
  }
}
