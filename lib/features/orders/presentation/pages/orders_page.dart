import 'package:animated_emoji/animated_emoji.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:go_router/go_router.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/constant/font_constants.dart';
import 'package:peng_cafe/core/enums/order_type_enum/order_type_enum.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/resource/common_state_widget/no_data_state_widget.dart';
import 'package:peng_cafe/core/resource/custom_widget/snake_bar_widget/snake_bar_widget.dart';
import 'package:peng_cafe/features/orders/presentation/bloc/delete_order_by_id_bloc.dart';
import 'package:peng_cafe/generated/locale_keys.g.dart';

import '../../../../config/route/routes_manager.dart';
import '../../../../core/enums/duration_enum.dart';
import '../../../../core/resource/main_page/main_page.dart';
import '../../../../core/resource/printing_service.dart';
import '../../../../core/util/helper/helper.dart';
import '../bloc/orders_bloc.dart';

import 'order_details_page.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  DurationEnum duration = DurationEnum.daily;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    return MainPage(
      body: Column(
        children: [
          // 🔹 Duration filter
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    duration = DurationEnum.daily;
                    pageController.jumpToPage(0);
                  },
                  child: Center(
                    child: Text(
                      LocaleKeys.durationEnum_daily.tr(),
                      style: TextStyle(
                        fontFamily: FontConstants.fontFamily(context.locale),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    duration = DurationEnum.allTime;
                    pageController.jumpToPage(1);
                  },
                  child: Center(
                    child: Text(
                      LocaleKeys.durationEnum_allTime.tr(),
                      style: TextStyle(
                        fontFamily: FontConstants.fontFamily(context.locale),
                      ),
                    ),
                  ),
                ),
                //daily

                //weekly
                ElevatedButton(
                  onPressed: () {
                    duration = DurationEnum.weekly;
                    pageController.jumpToPage(2);
                  },
                  child: Center(
                    child: Text(
                      LocaleKeys.durationEnum_weekly.tr(),
                      style: TextStyle(
                        fontFamily: FontConstants.fontFamily(context.locale),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    duration = DurationEnum.monthly;
                    pageController.jumpToPage(3);
                  },
                  child: Center(
                    child: Text(
                      LocaleKeys.durationEnum_monthly.tr(),
                      style: TextStyle(
                        fontFamily: FontConstants.fontFamily(context.locale),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: 4,
              controller: pageController,

              itemBuilder: (context, index) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          getItInstance<OrdersBloc>()
                            ..add(OrdersEvent.load(duration: duration)),
                    ),
                    BlocProvider(
                      create: (context) =>
                          getItInstance<DeleteOrderByIdBloc>()
                            ..add(DeleteOrderByIdEvent.started()),
                    ),
                  ],
                  child: BlocListener<DeleteOrderByIdBloc, DeleteOrderByIdState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        deleted: () {
                          context.read<OrdersBloc>().add(
                            OrdersEvent.refresh(duration: duration),
                          );
                          showMessage(
                            message: LocaleKeys.common_success.tr(),
                            context: context,
                          );
                        },
                        orElse: () {},
                      );
                    },
                    child: BlocBuilder<OrdersBloc, OrdersState>(
                      key: ValueKey(
                        duration,
                      ), // Add a key to force rebuild when duration changes
                      builder: (context, state) {
                        if (state is OrdersStateLoaded) {
                          print(
                            "duration: //${duration.displayName}, state: ${state.sections[0].title}",
                          );
                        }
                        return state.when(
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          error: (msg) => Center(child: Text(msg)),
                          loaded: (sections) {
                            return ListView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(16),
                              itemCount: sections.length,
                              itemBuilder: (context, index) {
                                final section = sections[index];

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // 🔹 Section title
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          section.title.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                fontFamily:
                                                    FontConstants.fontFamily(
                                                      context.locale,
                                                    ),
                                              ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            BillPrinter.printLastOrders(
                                              context: context,
                                              orders: sections,
                                              totalRevenue: sections.fold(
                                                0.0,
                                                (s, e) => s + e.total,
                                              ),
                                            );
                                          },
                                          icon: Icon(Icons.print_outlined),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 8),

                                    // 🔹 Orders list
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: section.orders.length,
                                      itemBuilder: (context, orderIndex) {
                                        final order =
                                            section.orders[orderIndex];
                                        return InkWell(
                                          onTap: () {
                                            context.pushNamed(
                                              RoutesName.orderDetailsPage,
                                              pathParameters: {
                                                'orderId': order.id.toString(),
                                                'tableType':
                                                    order.tableType.name,
                                                'tableNumber': order.tableNumber
                                                    .toString(),
                                                'orderType':
                                                    order.orderType.name,
                                              },
                                            );
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              bottom: 8.h,
                                            ),
                                            child:
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 12.h,
                                                    horizontal: 12.w,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Order #${order.orderNumber}',
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .titleMedium
                                                                ?.copyWith(
                                                                  fontFamily:
                                                                      FontConstants.fontFamily(
                                                                        context
                                                                            .locale,
                                                                      ),
                                                                ),
                                                          ),
                                                          Text(
                                                            '${LocaleKeys.tablePage_clientName.tr()}: ${order.customerName ?? "user"}',
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .titleMedium
                                                                ?.copyWith(
                                                                  fontFamily:
                                                                      FontConstants.fontFamily(
                                                                        context
                                                                            .locale,
                                                                      ),
                                                                ),
                                                          ),
                                                          order.orderType ==
                                                                  OrderTypeEnum
                                                                      .withdrawal
                                                              ? Row(
                                                                  children: [
                                                                    Text(
                                                                      LocaleKeys
                                                                          .ordersPage_withdraw
                                                                          .tr(),
                                                                      style: Theme.of(context)
                                                                          .textTheme
                                                                          .labelLarge
                                                                          ?.copyWith(
                                                                            fontFamily: FontConstants.fontFamily(
                                                                              context.locale,
                                                                            ),
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                      ),
                                                                      child: Text(
                                                                        '${order.createdAt.year}/${order.createdAt.month}/${order.createdAt.day}- ${order.createdAt.hour}:${order.createdAt.minute.toString().padLeft(2, '0')}',
                                                                        style:
                                                                            Theme.of(
                                                                              context,
                                                                            ).textTheme.labelLarge?.copyWith(
                                                                              fontFamily: FontConstants.fontFamily(
                                                                                context.locale,
                                                                              ),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "-${order.total.toStringAsFixed(2)} د.ع",
                                                                      style: Theme.of(context)
                                                                          .textTheme
                                                                          .labelLarge
                                                                          ?.copyWith(
                                                                            fontFamily: FontConstants.fontFamily(
                                                                              context.locale,
                                                                            ),
                                                                            color:
                                                                                Colors.red,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                )
                                                              : Row(
                                                                  children: [
                                                                    Text(
                                                                      'Table: ${order.tableNumber}',
                                                                      style: Theme.of(context)
                                                                          .textTheme
                                                                          .labelLarge
                                                                          ?.copyWith(
                                                                            fontFamily: FontConstants.fontFamily(
                                                                              context.locale,
                                                                            ),
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                      ),
                                                                      child: Text(
                                                                        '${order.createdAt.year}/${order.createdAt.month}/${order.createdAt.day}- ${order.createdAt.hour}:${order.createdAt.minute.toString().padLeft(2, '0')}',
                                                                        style:
                                                                            Theme.of(
                                                                              context,
                                                                            ).textTheme.labelLarge?.copyWith(
                                                                              fontFamily: FontConstants.fontFamily(
                                                                                context.locale,
                                                                              ),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Total: ${order.total.toStringAsFixed(2)}",
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .labelLarge
                                                                ?.copyWith(
                                                                  fontFamily:
                                                                      FontConstants.fontFamily(
                                                                        context
                                                                            .locale,
                                                                      ),
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      12.w,
                                                                ),
                                                            child: Text(
                                                              "Net Total: ${order.netTotal.toStringAsFixed(2)}",
                                                              style: Theme.of(context)
                                                                  .textTheme
                                                                  .labelLarge
                                                                  ?.copyWith(
                                                                    fontFamily:
                                                                        FontConstants.fontFamily(
                                                                          context
                                                                              .locale,
                                                                        ),
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Losses: ${order.losses.toStringAsFixed(2)}",
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .labelLarge
                                                                ?.copyWith(
                                                                  fontFamily:
                                                                      FontConstants.fontFamily(
                                                                        context
                                                                            .locale,
                                                                      ),
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      12.w,
                                                                ),
                                                            child: Text(
                                                              "Profit: ${Helper.formatPrice(order.profit)}",
                                                              style: Theme.of(context)
                                                                  .textTheme
                                                                  .labelLarge
                                                                  ?.copyWith(
                                                                    fontFamily:
                                                                        FontConstants.fontFamily(
                                                                          context
                                                                              .locale,
                                                                        ),
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional.only(
                                                                  start: 12.w,
                                                                ),
                                                            child: Builder(
                                                              builder: (context) => SizedBox(
                                                                width: 50.w,
                                                                height: 50.h,
                                                                child: IconButton(
                                                                  onPressed: () async {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (
                                                                            deleteDialogContext,
                                                                          ) => AlertDialog(
                                                                            backgroundColor: Theme.of(
                                                                              context,
                                                                            ).scaffoldBackgroundColor,
                                                                            title: AnimatedEmoji(
                                                                              AnimatedEmojis.question,
                                                                            ),
                                                                            content: Text(
                                                                              LocaleKeys.ordersPage_areYouSureToDeleteThisOrder.tr(),
                                                                              style: Theme.of(
                                                                                context,
                                                                              ).textTheme.labelLarge,
                                                                            ),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () {
                                                                                  context
                                                                                      .read<
                                                                                        DeleteOrderByIdBloc
                                                                                      >()
                                                                                      .add(
                                                                                        DeleteOrderByIdEvent.delete(
                                                                                          order.id,
                                                                                        ),
                                                                                      );
                                                                                  Navigator.pop(
                                                                                    deleteDialogContext,
                                                                                  );
                                                                                },
                                                                                child: Text(
                                                                                  LocaleKeys.common_delete.tr(),
                                                                                  style:
                                                                                      Theme.of(
                                                                                        context,
                                                                                      ).textTheme.labelLarge?.copyWith(
                                                                                        fontSize: 24.sp,
                                                                                        color: Theme.of(
                                                                                          context,
                                                                                        ).colorScheme.error,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                    );
                                                                  },
                                                                  icon: Icon(
                                                                    Icons
                                                                        .delete_outline,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ).asGlass(
                                                  clipBorderRadius:
                                                      BorderRadiusGeometry.circular(
                                                        12.r,
                                                      ),
                                                  border: Theme.of(
                                                    context,
                                                  ).defaultBorderSide,
                                                  frosted: false,
                                                ),
                                          ),
                                        );
                                      },
                                    ),

                                    // 🔹 Section total
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Total: ${section.total.toStringAsFixed(2)}',

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
                                            Text(
                                              'Net Total: ${section.netTotal.toStringAsFixed(2)}',

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
                                            Text(
                                              'Loss: ${section.loss.toStringAsFixed(2)}',

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
                                            Text(
                                              'Profit: ${section.profit.toStringAsFixed(2)}',

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
                                          ],
                                        ),
                                      ),
                                    ),

                                    const Divider(thickness: 2),
                                  ],
                                );
                              },
                            );
                          },
                          loadedWithNoData: () {
                            return NodataStateWidget();
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
