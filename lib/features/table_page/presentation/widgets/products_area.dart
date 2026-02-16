import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/enums/product_type_enum/product_type_enum.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/resource/common_state_widget/error_state_widget.dart';
import 'package:peng_cafe/core/resource/common_state_widget/no_data_state_widget.dart';
import 'package:peng_cafe/core/util/helper/helper.dart';
import 'package:peng_cafe/features/products/data/models/product_model.dart';
import 'package:peng_cafe/features/products/presentation/bloc/get_products_bloc.dart';
import 'package:peng_cafe/features/products/presentation/widgets/product_widget.dart';

import '../../../../core/enums/tables_enum/table_type_enum.dart';
import '../../data/models/order_item_model.dart';
import '../bloc/table_page_bloc.dart';

class ProductsArea extends StatelessWidget {
  final TableTypeEnum tableType;
  const ProductsArea({super.key, required this.tableType});
  @override
  Widget build(BuildContext context) {
    final ProductModel productModel = ProductModel(
      locale: Helper.getCountryCode(context),
    );
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
            child: BlocProvider(
              create: (context) => getItInstance<GetProductsBloc>()
                ..add(
                  GetProductsEvent.getProducts(productsModel: productModel),
                ),
              child: BlocBuilder<GetProductsBloc, GetProductsState>(
                builder: (context, state) {
                  print(" Products state: $state");
                  if (state is GetProductsStateLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetProductsStateError) {
                    return Center(child: ErrorStateWidget());
                  } else if (state is GetProductsStateNoData) {
                    return const Center(child: NodataStateWidget());
                  } else if (state is GetProductsStateLoaded) {
                    final products = state.products;
                    return GridView.builder(
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
                                  productId: product.id ?? 0,
                                  productType:
                                      product.productType ??
                                      ProductTypeEnum.foodAndBeverage,
                                  price: product.price,
                                  tableType: tableType,
                                ),
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
