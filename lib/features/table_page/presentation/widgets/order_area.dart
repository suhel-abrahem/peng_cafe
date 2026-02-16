import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/constant/font_constants.dart';
import 'package:peng_cafe/core/enums/tables_enum/table_type_enum.dart';
import 'package:peng_cafe/core/resource/common_state_widget/no_data_state_widget.dart';
import 'package:peng_cafe/core/resource/custom_widget/custom_input_field/custom_input_field.dart';
import 'package:peng_cafe/core/util/helper/helper.dart';

import '../bloc/table_page_bloc.dart';

class OrderArea extends StatelessWidget {
  final TableTypeEnum tableType;
  const OrderArea({super.key, required this.tableType});

  @override
  Widget build(BuildContext context) {
    final String? locale = Helper.getCountryCode(context);
    return BlocBuilder<TablePageBloc, TablePageState>(
      builder: (context, state) {
        return state.when(
          initial: () => NodataStateWidget(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(child: Text(message)),
          loaded: (order, items) {
            return Container(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order #${order.orderNumber}",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontFamily: FontConstants.fontFamily(context.locale),
                      fontSize: 32.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];

                        return Padding(
                          padding: EdgeInsets.all(12.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item.productName ?? "Product",
                                  style: Theme.of(context).textTheme.labelLarge
                                      ?.copyWith(
                                        fontFamily: FontConstants.fontFamily(
                                          context.locale,
                                        ),
                                      ),
                                ),
                              ),

                              /// Editable Quantity
                              CustomInputField(
                                key: ValueKey("quantity_${item.quantity}"),
                                width: 120.w,
                                height: 60.h,
                                prefixPadding: EdgeInsetsDirectional.only(
                                  top: 0,
                                  start: 8.w,
                                  end: 8.w,
                                ),
                                prefix: SizedBox(
                                  width: 30.w,
                                  height: 50.h,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 30.w,
                                        height: 20.h,
                                        child: InkWell(
                                          onTap: () {
                                            context.read<TablePageBloc>().add(
                                              TablePageEvent.setItemQuantity(
                                                locale: locale ?? "ar",
                                                itemId: item.id,
                                                quantity: item.quantity + 1,
                                                tableType: tableType,
                                              ),
                                            );
                                          },
                                          child: Center(
                                            child: Icon(
                                              size: 30.sp,
                                              Icons.arrow_drop_up,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30.w,
                                        height: 20.h,
                                        child: InkWell(
                                          onTap: () {
                                            context.read<TablePageBloc>().add(
                                              TablePageEvent.setItemQuantity(
                                                itemId: item.id,
                                                locale: locale ?? "ar",
                                                quantity: item.quantity - 1,
                                                tableType: tableType,
                                              ),
                                            );
                                          },
                                          child: Center(
                                            child: Icon(
                                              size: 30.sp,
                                              Icons.arrow_drop_down,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                initialValue: item.quantity.toString(),
                                textInputType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                onSubmitted: (value) {
                                  final qty = double.tryParse(value) ?? 1;

                                  context.read<TablePageBloc>().add(
                                    TablePageEvent.setItemQuantity(
                                      itemId: item.id,
                                      quantity: qty,
                                      tableType: tableType,
                                      locale: locale ?? "ar",
                                    ),
                                  );
                                },
                              ),

                              SizedBox(width: 20.w),

                              Text(
                                "${item.total.toStringAsFixed(2)}",
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(
                                      fontFamily: FontConstants.fontFamily(
                                        context.locale,
                                      ),
                                    ),
                              ),

                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  context.read<TablePageBloc>().add(
                                    TablePageEvent.setItemQuantity(
                                      locale: locale ?? "ar",
                                      tableType: tableType,
                                      itemId: item.id,
                                      quantity: 0,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ).asGlass(
                          tintColor: Theme.of(context).scaffoldBackgroundColor,
                          clipBorderRadius: BorderRadius.circular(12.r),
                          border: Theme.of(context).defaultBorderSide,
                          blurX: 10,
                          blurY: 10,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ).asGlass(
              tintColor: Theme.of(context).scaffoldBackgroundColor,
              clipBorderRadius: BorderRadius.circular(16.r),
              border: Theme.of(context).defaultBorderSide,
              blurX: 10,
              blurY: 10,
            );
          },
        );
      },
    );
  }
}
