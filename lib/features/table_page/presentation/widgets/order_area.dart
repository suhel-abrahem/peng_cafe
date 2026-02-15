import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';

import '../bloc/table_page_bloc.dart';

class OrderArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TablePageBloc, TablePageState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
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
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];

                        return Card(
                          child: Padding(
                            padding: EdgeInsets.all(12.w),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    item.productName ?? "Product",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelLarge,
                                  ),
                                ),

                                /// Editable Quantity
                                SizedBox(
                                  width: 80.w,
                                  child: TextFormField(
                                    initialValue: item.quantity.toString(),
                                    keyboardType: TextInputType.number,
                                    onFieldSubmitted: (value) {
                                      final qty = double.tryParse(value) ?? 1;

                                      context.read<TablePageBloc>().add(
                                        TablePageEvent.setItemQuantity(
                                          itemId: item.id,
                                          quantity: qty,
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                SizedBox(width: 20.w),

                                Text("${item.total.toStringAsFixed(2)}"),

                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    context.read<TablePageBloc>().add(
                                      TablePageEvent.setItemQuantity(
                                        itemId: item.id,
                                        quantity: 0,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
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
