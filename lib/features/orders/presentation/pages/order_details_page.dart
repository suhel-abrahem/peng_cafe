import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/resource/common_state_widget/no_data_state_widget.dart';
import 'package:peng_cafe/core/util/helper/helper.dart';
import 'package:peng_cafe/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:peng_cafe/features/table_page/presentation/bloc/table_page_bloc.dart';

import '../../../../core/constant/font_constants.dart';
import '../../../../core/enums/product_type_enum/product_type_enum.dart';
import '../../../../core/enums/tables_enum/table_type_enum.dart';
import '../../../../core/resource/common_state_widget/error_state_widget.dart';
import '../../../../core/resource/custom_widget/custom_input_field/custom_input_field.dart';
import '../../../../core/resource/printing_service.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../products/data/models/product_model.dart';
import '../../../products/presentation/bloc/get_products_bloc.dart';
import '../../../products/presentation/widgets/product_widget.dart';
import '../../../table_page/data/models/order_item_model.dart';
import '../../../table_page/presentation/widgets/checkout_widget.dart';
import '../bloc/order_details_bloc.dart';

class OrderDetailsPage extends StatefulWidget {
  final int orderId;

  const OrderDetailsPage({super.key, required this.orderId});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  bool isEditing = false;
  ProductModel productModel = ProductModel();
  Timer? _debounce;
  @override
  void didUpdateWidget(covariant OrderDetailsPage oldWidget) {
    productModel = productModel.copyWith(
      locale: Helper.getCountryCode(context),
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    String? locale = Helper.getCountryCode(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Order Details')),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<OrderDetailsBloc>(
            create: (context) => getItInstance<OrderDetailsBloc>()
              ..add(
                OrderDetailsEvent.load(
                  orderId: widget.orderId,
                  locale: locale ?? 'ar',
                ),
              ),
          ),
          BlocProvider<TablePageBloc>(
            create: (context) => getItInstance<TablePageBloc>(),
          ),
          BlocProvider(
            create: (context) => getItInstance<GetProductsBloc>()
              ..add(GetProductsEvent.getProducts(productsModel: productModel)),
          ),
        ],
        child: BlocListener<OrderDetailsBloc, OrderDetailsState>(
          listener: (context, state) {
            state.maybeWhen(
              loaded: (order, items) {
                context.read<TablePageBloc>().add(
                  TablePageEvent.loadTable(
                    tableNumber: order.tableNumber,
                    userId: 0,
                    tableType: order.tableType,
                    orderType: order.orderType,
                    isEditing: true,
                    orderId: order.id,
                    locale: locale ?? 'ar',
                  ),
                );
              },
              orElse: () {},
            );
          },
          child: BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
            builder: (context, state) {
              return state.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (msg) => Center(child: Text(msg)),
                loaded: (order, items) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          child:
                              Container(
                                padding: EdgeInsets.all(16.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Order #${order.orderNumber}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge
                                              ?.copyWith(
                                                fontFamily:
                                                    FontConstants.fontFamily(
                                                      context.locale,
                                                    ),
                                                fontSize: 32.sp,
                                              ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            return SizedBox(
                                              width: 250.w,
                                              height: 50.h,
                                              child: TextField(
                                                decoration:
                                                    const InputDecoration(
                                                      hintText:
                                                          "Search product...",
                                                      prefixIcon: Icon(
                                                        Icons.search,
                                                      ),
                                                    ),
                                                onChanged: (value) {
                                                  if (_debounce?.isActive ??
                                                      false)
                                                    _debounce!.cancel();

                                                  _debounce = Timer(
                                                    const Duration(
                                                      milliseconds: 300,
                                                    ),
                                                    () {
                                                      context
                                                          .read<
                                                            GetProductsBloc
                                                          >()
                                                          .add(
                                                            GetProductsEvent.searchProducts(
                                                              query: value
                                                                  .trim(),
                                                              locale: context
                                                                  .locale
                                                                  .languageCode,
                                                            ),
                                                          );
                                                    },
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isEditing = !isEditing;
                                                });
                                              },
                                              icon: AnimatedRotation(
                                                duration: const Duration(
                                                  milliseconds: 300,
                                                ),
                                                turns: isEditing ? 0.5 : 0,
                                                child: Icon(
                                                  isEditing
                                                      ? Icons.close
                                                      : Icons.edit,
                                                  size: 30.sp,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
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
                                                icon: Icon(
                                                  Icons.print,
                                                  size: 30.sp,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Expanded(
                                      child: ListView.builder(
                                        shrinkWrap: true,
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
                                                  child: Text(
                                                    item.productName ??
                                                        "Product",
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
                                                CustomInputField(
                                                  enabled: isEditing,
                                                  key: ValueKey(
                                                    "quantity_${item.quantity}",
                                                  ),
                                                  width: 120.w,
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
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 30.w,
                                                          height: 20.h,
                                                          child: InkWell(
                                                            onTap: () {
                                                              print(
                                                                "Incrementing quantity${item.quantity} for item ${item.id},orderId=${order.id}, tableNumber=${order.tableNumber}, tableType=${item.tableType}",
                                                              );
                                                              context.read<TablePageBloc>().add(
                                                                TablePageEvent.setItemQuantity(
                                                                  locale:
                                                                      locale ??
                                                                      "ar",
                                                                  itemId:
                                                                      item.id,
                                                                  quantity:
                                                                      item.quantity +
                                                                      1,
                                                                  tableType: item
                                                                      .tableType,
                                                                  orderId:
                                                                      order.id,
                                                                  tableNumber: order
                                                                      .tableNumber,
                                                                ),
                                                              );
                                                              context
                                                                  .read<
                                                                    OrderDetailsBloc
                                                                  >()
                                                                  .add(
                                                                    OrderDetailsEvent.load(
                                                                      orderId:
                                                                          widget
                                                                              .orderId,
                                                                      locale:
                                                                          locale ??
                                                                          'ar',
                                                                    ),
                                                                  );
                                                              setState(() {});
                                                            },
                                                            child: Center(
                                                              child: Icon(
                                                                size: 30.sp,
                                                                Icons
                                                                    .arrow_drop_up,
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
                                                                  itemId:
                                                                      item.id,
                                                                  locale:
                                                                      locale ??
                                                                      "ar",
                                                                  quantity:
                                                                      item.quantity -
                                                                      1,
                                                                  tableType: item
                                                                      .tableType,
                                                                  orderId:
                                                                      order.id,
                                                                  tableNumber: order
                                                                      .tableNumber,
                                                                ),
                                                              );
                                                              context
                                                                  .read<
                                                                    OrderDetailsBloc
                                                                  >()
                                                                  .add(
                                                                    OrderDetailsEvent.load(
                                                                      orderId:
                                                                          widget
                                                                              .orderId,
                                                                      locale:
                                                                          locale ??
                                                                          'ar',
                                                                    ),
                                                                  );
                                                            },
                                                            child: Center(
                                                              child: Icon(
                                                                size: 30.sp,
                                                                Icons
                                                                    .arrow_drop_down,
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
                                                        double.tryParse(
                                                          value,
                                                        ) ??
                                                        1;

                                                    context
                                                        .read<TablePageBloc>()
                                                        .add(
                                                          TablePageEvent.setItemQuantity(
                                                            itemId: item.id,
                                                            quantity: qty,
                                                            tableType:
                                                                item.tableType,
                                                            locale:
                                                                locale ?? "ar",
                                                            orderId: order.id,
                                                            tableNumber: order
                                                                .tableNumber,
                                                          ),
                                                        );
                                                    context
                                                        .read<
                                                          OrderDetailsBloc
                                                        >()
                                                        .add(
                                                          OrderDetailsEvent.load(
                                                            orderId:
                                                                widget.orderId,
                                                            locale:
                                                                locale ?? 'ar',
                                                          ),
                                                        );
                                                  },
                                                ),

                                                SizedBox(width: 20.w),

                                                Text(
                                                  "${item.total.toStringAsFixed(2)}",
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

                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.delete,
                                                  ),
                                                  onPressed: isEditing
                                                      ? () {
                                                          context.read<TablePageBloc>().add(
                                                            TablePageEvent.setItemQuantity(
                                                              locale:
                                                                  locale ??
                                                                  "ar",
                                                              tableType: item
                                                                  .tableType,
                                                              itemId: item.id,
                                                              quantity: 0,
                                                              orderId: order.id,
                                                              tableNumber: order
                                                                  .tableNumber,
                                                            ),
                                                          );
                                                          context
                                                              .read<
                                                                OrderDetailsBloc
                                                              >()
                                                              .add(
                                                                OrderDetailsEvent.load(
                                                                  orderId: widget
                                                                      .orderId,
                                                                  locale:
                                                                      locale ??
                                                                      'ar',
                                                                ),
                                                              );
                                                        }
                                                      : null,
                                                ),
                                              ],
                                            ),
                                          ).asGlass(
                                            tintColor: Theme.of(
                                              context,
                                            ).scaffoldBackgroundColor,

                                            border: Theme.of(
                                              context,
                                            ).defaultBorderSide,
                                            blurX: 10,
                                            blurY: 10,
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
                                clipBorderRadius: BorderRadius.circular(16.r),
                                border: Theme.of(context).defaultBorderSide,
                                blurX: 10,
                                blurY: 10,
                              ),
                        ),
                      ),
                      if (isEditing)
                        Expanded(
                          flex: 1,
                          child: BlocBuilder<GetProductsBloc, GetProductsState>(
                            builder: (context, state) {
                              print(" Products state: $state");
                              if (state is GetProductsStateLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is GetProductsStateError) {
                                return Center(child: ErrorStateWidget());
                              } else if (state is GetProductsStateNoData) {
                                return const Center(child: NodataStateWidget());
                              } else if (state is GetProductsStateLoaded) {
                                final products = state.products;
                                return Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    top: 8.h,
                                    bottom: 8.h,
                                    end: 16.w,
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: GridView.builder(
                                          shrinkWrap: true,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 12,
                                                crossAxisSpacing: 12,
                                              ),
                                          itemCount: products.length,
                                          itemBuilder: (context, index) {
                                            final product = products[index];
                                            return InkWell(
                                              onTap: () {
                                                context.read<TablePageBloc>().add(
                                                  TablePageEvent.addProduct(
                                                    item: OrderItemModel(
                                                      productId:
                                                          product.id ?? 0,
                                                      productType:
                                                          product.productType ??
                                                          ProductTypeEnum
                                                              .foodAndBeverage,
                                                      price: product.price,
                                                      orderId: order.id,
                                                      tableType:
                                                          order.tableType,
                                                      tableNumber:
                                                          order.tableNumber,
                                                    ),
                                                  ),
                                                );
                                                context
                                                    .read<OrderDetailsBloc>()
                                                    .add(
                                                      OrderDetailsEvent.load(
                                                        orderId: widget.orderId,
                                                        locale: locale ?? 'ar',
                                                      ),
                                                    );
                                              },
                                              child: ProductWidget(
                                                isSelected: false,
                                                canSelect: false,
                                                productEntity: products[index],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      BlocListener<
                                        TablePageBloc,
                                        TablePageState
                                      >(
                                        listener: (context, state) {
                                          state.maybeWhen(
                                            checkoutSuccess:
                                                (
                                                  order,
                                                  items,
                                                  paid,
                                                  remaining,
                                                ) async {
                                                  // 🔔 اغلق popup
                                                  Navigator.of(context).pop();

                                                  // 🖨️ اطبع الفاتورة
                                                  await BillPrinter.printBill(
                                                    context: context,
                                                    order: order,
                                                    items: items,
                                                    paidAmount: paid,
                                                    remaining: remaining,
                                                  );
                                                },
                                            orElse: () {},
                                          );
                                        },
                                        child: BlocBuilder<TablePageBloc, TablePageState>(
                                          builder: (context, state) {
                                            return state.maybeWhen(
                                              loaded: (order, items) {
                                                final total = items
                                                    .fold<double>(
                                                      0,
                                                      (sum, e) =>
                                                          sum +
                                                          (e.quantity *
                                                              e.price),
                                                    );

                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Total: ${total.toStringAsFixed(2)}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge
                                                          ?.copyWith(
                                                            fontFamily:
                                                                FontConstants.fontFamily(
                                                                  context
                                                                      .locale,
                                                                ),
                                                            fontSize: 28.sp,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Builder(
                                                      builder: (context) {
                                                        return ElevatedButton(
                                                          onPressed: total > 0
                                                              ? () async {
                                                                  final tableBloc =
                                                                      context
                                                                          .read<
                                                                            TablePageBloc
                                                                          >();
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (context) => Center(
                                                                      child: CheckoutWidget(
                                                                        totalAmount:
                                                                            total,
                                                                        onCheckout: (value) {
                                                                          tableBloc.add(
                                                                            TablePageEvent.checkout(
                                                                              paidAmount: value.paidAmount,
                                                                              remaining: value.remaining,
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                              : null,
                                                          child: Text(
                                                            LocaleKeys
                                                                .tablePage_checkOut
                                                                .tr(),
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  FontConstants.fontFamily(
                                                                    context
                                                                        .locale,
                                                                  ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                              orElse: () => const SizedBox(),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return ErrorStateWidget();
                              }
                              // return GridView.builder(
                              //                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              //                         crossAxisCount: 3,
                              //                         mainAxisSpacing: 12,
                              //                         crossAxisSpacing: 12,
                              //                       ),
                              //                       itemCount: 20, // temporary
                              //                       itemBuilder: (context, index) {
                              //                         return InkWell(
                              //                           onTap: () {
                              //                             context.read<TablePageBloc>().add(
                              //                               TablePageEvent.addProduct(
                              //                                 item: OrderItemModel(
                              //                                   productType: ,
                              //                                   productId: index,
                              //                                   price: 5,
                              //                                   tableType: tableType,
                              //                                 ),
                              //                               ),
                              //                             );
                              //                           },
                              //                           child: Card(child: Center(child: Text("Product $index"))),
                              //                         );
                              //                       },
                              //                     );
                            },
                          ),
                        ),
                    ],
                  );
                },
                initial: () {
                  return const SizedBox();
                },
                loadedWithNoData: () {
                  return const NodataStateWidget();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
