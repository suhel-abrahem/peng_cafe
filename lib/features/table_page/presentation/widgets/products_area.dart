import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';

import '../../data/models/order_item_model.dart';
import '../bloc/table_page_bloc.dart';

class ProductsArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: "Search product...",
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              // later connect to searchProductsByName
            },
          ),

          SizedBox(height: 20.h),

          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemCount: 20, // temporary
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.read<TablePageBloc>().add(
                      TablePageEvent.addProduct(
                        item: OrderItemModel(productId: index, price: 5),
                      ),
                    );
                  },
                  child: Card(child: Center(child: Text("Product $index"))),
                );
              },
            ),
          ),

          Divider(),

          /// BILL SUMMARY
          BlocBuilder<TablePageBloc, TablePageState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (order, items) {
                  final total = items.fold<double>(
                    0,
                    (sum, e) => sum + (e.quantity * e.price),
                  );

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total: ${total.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 10.h),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Checkout"),
                      ),
                    ],
                  );
                },
                orElse: () => const SizedBox(),
              );
            },
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
  }
}
