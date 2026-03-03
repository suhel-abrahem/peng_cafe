import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/constant/font_constants.dart';
import 'package:peng_cafe/core/enums/order_type_enum/order_type_enum.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/resource/common_state_widget/no_data_state_widget.dart';
import 'package:peng_cafe/generated/locale_keys.g.dart';

import '../../../../core/enums/duration_enum.dart';
import '../../../../core/resource/main_page/main_page.dart';
import '../../../../core/resource/printing_service.dart';
import '../bloc/orders_bloc.dart';

import 'order_details_page.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  DurationEnum duration = DurationEnum.allTime;
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
                    duration = DurationEnum.allTime;
                    pageController.jumpToPage(0);
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
                ElevatedButton(
                  onPressed: () {
                    duration = DurationEnum.daily;
                    pageController.jumpToPage(1);
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
                return BlocProvider(
                  create: (context) =>
                      getItInstance<OrdersBloc>()
                        ..add(OrdersEvent.load(duration: duration)),
                  child: BlocBuilder<OrdersBloc, OrdersState>(
                    key: ValueKey(
                      duration,
                    ), // Add a key to force rebuild when duration changes
                    builder: (context, state) {
                      if (state is OrdersStateLoaded) {
                        print(
                          "duration: ${duration.displayName}, state: ${state.sections[0].title}",
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
                                      final order = section.orders[orderIndex];
                                      return ListTile(
                                        title: Text(
                                          'Order #${order.orderNumber}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                fontFamily:
                                                    FontConstants.fontFamily(
                                                      context.locale,
                                                    ),
                                              ),
                                        ),
                                        subtitle:
                                            order.orderType ==
                                                OrderTypeEnum.withdrawal
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
                                                          fontFamily:
                                                              FontConstants.fontFamily(
                                                                context.locale,
                                                              ),
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 8,
                                                        ),
                                                    child: Text(
                                                      '${order.createdAt.year}/${order.createdAt.month}/${order.createdAt.day}- ${order.createdAt.hour}:${order.createdAt.minute.toString().padLeft(2, '0')}',
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
                                                    "-${order.total.toStringAsFixed(2)} د.ع",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge
                                                        ?.copyWith(
                                                          fontFamily:
                                                              FontConstants.fontFamily(
                                                                context.locale,
                                                              ),
                                                          color: Colors.red,
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
                                                          fontFamily:
                                                              FontConstants.fontFamily(
                                                                context.locale,
                                                              ),
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 8,
                                                        ),
                                                    child: Text(
                                                      '${order.createdAt.year}/${order.createdAt.month}/${order.createdAt.day}- ${order.createdAt.hour}:${order.createdAt.minute.toString().padLeft(2, '0')}',
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
                                                ],
                                              ),
                                        trailing: Text(
                                          order.total.toStringAsFixed(2),
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
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => OrderDetailsPage(
                                                orderId: order.id,
                                              ),
                                            ),
                                          );
                                        },
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
                                      child: Text(
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
