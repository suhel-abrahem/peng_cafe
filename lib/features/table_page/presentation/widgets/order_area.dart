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

import '../../../../core/resource/printing_service.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/entities/order_item_entity.dart';
import '../bloc/table_page_bloc.dart';

class OrderArea extends StatefulWidget {
  final TableTypeEnum tableType;
  final bool? isOrderDetails;
  final bool? editingMode;
  final ValueChanged<bool>? onEditModeChanged;
  const OrderArea({
    super.key,
    required this.tableType,
    this.isOrderDetails = false,
    this.onEditModeChanged,
    this.editingMode,
  });

  @override
  State<OrderArea> createState() => _OrderAreaState();
}

class _OrderAreaState extends State<OrderArea> {
  bool isEditing = false;
  @override
  void initState() {
    isEditing = widget.editingMode ?? false;
    super.initState();
  }

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
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child:
                  Container(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Order #${order.orderNumber}",
                              style: Theme.of(context).textTheme.headlineLarge
                                  ?.copyWith(
                                    fontFamily: FontConstants.fontFamily(
                                      context.locale,
                                    ),
                                    fontSize: 32.sp,
                                  ),
                            ),
                            Visibility(
                              visible: widget.isOrderDetails == true,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isEditing = !isEditing;
                                      });
                                      if (widget.onEditModeChanged != null) {
                                        widget.onEditModeChanged!(isEditing);
                                      }
                                    },
                                    icon: AnimatedRotation(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      turns: isEditing ? 0.5 : 0,
                                      child: Icon(
                                        isEditing ? Icons.close : Icons.edit,
                                        size: 30.sp,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(
                                      start: 8.w,
                                    ),
                                    child: IconButton(
                                      onPressed: () async {
                                        await BillPrinter.printBill(
                                          context: context,
                                          order: order,
                                          items: items,
                                          paidAmount: 0,
                                          remaining: 0,
                                        );
                                      },
                                      icon: Icon(Icons.print, size: 30.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20.h),
                        Expanded(
                          child: ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final item = items[index];

                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 16.h,
                                  horizontal: 8.w,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Text(
                                        item.productName ?? "Product",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              fontFamily:
                                                  FontConstants.fontFamily(
                                                    context.locale,
                                                  ),
                                            ),
                                      ),
                                    ),

                                    /// Editable Quantity
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                        ),
                                        child: CustomInputField(
                                          key: ValueKey(
                                            "quantity_${item.quantity}",
                                          ),
                                          width: 140.w,
                                          height: 60.h,
                                          prefixPadding:
                                              EdgeInsetsDirectional.only(
                                                top: 0,
                                                start: 8.w,
                                                end: 8.w,
                                              ),
                                          prefix: SizedBox(
                                            width: 30.w,
                                            height: 50.h,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 30.w,
                                                  height: 20.h,
                                                  child: InkWell(
                                                    onTap: () {
                                                      context
                                                          .read<TablePageBloc>()
                                                          .add(
                                                            TablePageEvent.setItemQuantity(
                                                              locale:
                                                                  locale ??
                                                                  "ar",
                                                              itemId: item.id,
                                                              quantity:
                                                                  item.quantity +
                                                                  1,
                                                              tableType: widget
                                                                  .tableType,
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
                                                      context
                                                          .read<TablePageBloc>()
                                                          .add(
                                                            TablePageEvent.setItemQuantity(
                                                              itemId: item.id,
                                                              locale:
                                                                  locale ??
                                                                  "ar",
                                                              quantity:
                                                                  item.quantity -
                                                                  1,
                                                              tableType: widget
                                                                  .tableType,
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
                                          initialValue: item.quantity
                                              .toString(),
                                          textInputType:
                                              TextInputType.numberWithOptions(
                                                decimal: true,
                                              ),
                                          onSubmitted: (value) {
                                            final qty =
                                                double.tryParse(value) ?? 1;

                                            context.read<TablePageBloc>().add(
                                              TablePageEvent.setItemQuantity(
                                                itemId: item.id,
                                                quantity: qty,
                                                tableType: widget.tableType,
                                                locale: locale ?? "ar",
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "total ${Helper.formatPrice(item.total)}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              fontFamily:
                                                  FontConstants.fontFamily(
                                                    context.locale,
                                                  ),
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                        ),
                                        child: Text(
                                          "net total ${Helper.formatPrice(item.totalAfterDiscount)}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                fontFamily:
                                                    FontConstants.fontFamily(
                                                      context.locale,
                                                    ),
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(
                                        start: 12.w,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          context.read<TablePageBloc>().add(
                                            TablePageEvent.setItemQuantity(
                                              locale: locale ?? "ar",
                                              tableType: widget.tableType,
                                              itemId: item.id,
                                              quantity: 0,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ).asGlass(
                                tintColor: Theme.of(
                                  context,
                                ).scaffoldBackgroundColor,

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
                  ),
            );
          },
          checkoutSuccess:
              (
                OrderEntity order,
                List<OrderItemEntity> items,
                double paidAmount,
                double remaining,
              ) {
                return SizedBox.shrink();
              },
        );
      },
    );
  }
}
