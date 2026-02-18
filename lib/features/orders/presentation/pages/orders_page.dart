import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peng_cafe/core/constant/font_constants.dart';
import 'package:peng_cafe/core/injection_container.dart';

import '../../../../core/resource/main_page/main_page.dart';
import '../bloc/orders_bloc.dart';

import 'order_details_page.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainPage(
      body: BlocProvider(
        create: (context) =>
            getItInstance<OrdersBloc>()..add(const OrdersEvent.load()),
        child: BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (msg) => Center(child: Text(msg)),
              loaded: (sections) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: sections.length,
                  itemBuilder: (context, index) {
                    final section = sections[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🔹 Section title
                        Text(
                          section.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),

                        const SizedBox(height: 8),

                        // 🔹 Orders list
                        ...section.orders.map(
                          (order) => Container(
                            child: ListTile(
                              title: Text(
                                'Order #${order.orderNumber}',
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      fontFamily: FontConstants.fontFamily(
                                        context.locale,
                                      ),
                                    ),
                              ),
                              subtitle: Text(
                                'Table: ${order.tableNumber}',
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(
                                      fontFamily: FontConstants.fontFamily(
                                        context.locale,
                                      ),
                                    ),
                              ),
                              trailing: Text(
                                order.total.toStringAsFixed(2),
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(
                                      fontFamily: FontConstants.fontFamily(
                                        context.locale,
                                      ),
                                    ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        OrderDetailsPage(orderId: order.id!),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        // 🔹 Section total
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              'Total: ${section.total.toStringAsFixed(2)}',

                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(
                                    fontFamily: FontConstants.fontFamily(
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
            );
          },
        ),
      ),
    );
  }
}
