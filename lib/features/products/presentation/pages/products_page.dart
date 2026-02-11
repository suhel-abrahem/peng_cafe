import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/resource/common_state_widget/error_state_widget.dart';
import 'package:peng_cafe/core/resource/common_state_widget/no_data_state_widget.dart';
import 'package:peng_cafe/core/resource/main_page/main_page.dart';
import 'package:peng_cafe/core/util/helper/helper.dart';
import 'package:peng_cafe/features/products/data/models/product_model.dart';
import 'package:peng_cafe/generated/locale_keys.g.dart';

import '../../../../core/constant/font_constants.dart';
import '../bloc/get_products_bloc.dart';
import '../widgets/add_product_form.dart';
import '../widgets/product_widget.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductModel productModel = ProductModel(
      locale: Helper.getCountryCode(context),
    );
    return MainPage(
      body: BlocProvider<GetProductsBloc>(
        create: (context) =>
            getItInstance<GetProductsBloc>()
              ..add(GetProductsEvent.getProducts(productsModel: productModel)),
        child: ListView(
          shrinkWrap: true,
          children: [
            //title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Text(
                LocaleKeys.productsPage_title.tr(),
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontFamily: FontConstants.fontFamily(context.locale),
                  fontSize: 32.sp,
                ),
              ),
            ),
            // add product Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child:
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 12.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //add product button
                        ElevatedButton(
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: Theme.of(context)
                                    .scaffoldBackgroundColor
                                    .withValues(alpha: 0.66),
                                title: Text(
                                  LocaleKeys.productsPage_addProduct.tr(),
                                  style: TextStyle(
                                    fontFamily: FontConstants.fontFamily(
                                      context.locale,
                                    ),
                                  ),
                                ),
                                content: Center(child: AddProductForm()),
                              ),
                            );
                          },
                          child: Text(
                            LocaleKeys.productsPage_addProduct.tr(),
                            style: TextStyle(
                              fontFamily: FontConstants.fontFamily(
                                context.locale,
                              ),
                            ),
                          ),
                        ),

                        //delete and edit row with selections
                        Row(
                          children: [
                            //select button
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.check_rounded),
                              tooltip: LocaleKeys.productsPage_selectProduct
                                  .tr(),
                            ),
                            //select all button
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.checklist_rounded),
                                tooltip: LocaleKeys
                                    .productsPage_selectAllProducts
                                    .tr(),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit_rounded),
                              tooltip: LocaleKeys.productsPage_edit.tr(),
                            ),

                            Padding(
                              padding: EdgeInsetsDirectional.only(start: 20.w),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete_rounded),
                                tooltip: LocaleKeys.productsPage_delete.tr(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ).asGlass(
                    blurX: 10,
                    blurY: 10,
                    frosted: true,
                    clipBorderRadius: BorderRadius.circular(30.r),
                  ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 40.w),
              child: Text(
                LocaleKeys.productsPage_products.tr(),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontFamily: FontConstants.fontFamily(context.locale),
                  fontSize: 24.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = (constraints.maxWidth / 300).floor();
                  return BlocBuilder<GetProductsBloc, GetProductsState>(
                    builder: (context, state) {
                      return state.maybeMap(
                        orElse: () => ErrorStateWidget(),
                        loaded: (value) => GridView.builder(
                          key: ValueKey(crossAxisCount),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 20.w,
                                mainAxisSpacing: 20.h,
                                childAspectRatio: 1,
                                mainAxisExtent: 300.h,
                              ),
                          itemCount: value.products.length,
                          itemBuilder: (context, index) {
                            print("product id: ${value.products[index]}");
                            return ProductWidget(
                              productEntity: value.products[index],
                            );
                          },
                        ),
                        noData: (value) => NodataStateWidget(),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
