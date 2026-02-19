import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/resource/common_state_widget/no_data_state_widget.dart';
import 'package:peng_cafe/core/util/helper/helper.dart';
import 'package:peng_cafe/features/orders/presentation/bloc/orders_bloc.dart';

import '../../../../core/constant/font_constants.dart';
import '../bloc/order_details_bloc.dart';

class OrderDetailsPage extends StatelessWidget {
  final int orderId;

  const OrderDetailsPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    String? locale = Helper.getCountryCode(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Order Details')),
      body: BlocProvider(
        create: (context) => getItInstance<OrderDetailsBloc>()
          ..add(
            OrderDetailsEvent.load(orderId: orderId, locale: locale ?? 'ar'),
          ),
        child: BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (msg) => Center(child: Text(msg)),
              loaded: (order, items) {
                if (order == null || items == null) {
                  return const Center(child: Text('No data'));
                }

                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text(
                      'Order #${order.orderNumber}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontFamily: FontConstants.fontFamily(context.locale),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Table: ${order.tableNumber}',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontFamily: FontConstants.fontFamily(context.locale),
                      ),
                    ),
                    const Divider(),

                    ...items.map(
                      (item) => ListTile(
                        title: Text(
                          item!.productName ?? '',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                fontFamily: FontConstants.fontFamily(
                                  context.locale,
                                ),
                              ),
                        ),
                        subtitle: Text(
                          'Qty: ${item.quantity}',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                fontFamily: FontConstants.fontFamily(
                                  context.locale,
                                ),
                              ),
                        ),
                        trailing: Text(
                          item.total.toStringAsFixed(2),
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                fontFamily: FontConstants.fontFamily(
                                  context.locale,
                                ),
                              ),
                        ),
                      ),
                    ),

                    const Divider(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Total: ${order.total.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontFamily: FontConstants.fontFamily(context.locale),
                          fontWeight: FontWeight.bold,
                        ),
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
    );
  }
}
