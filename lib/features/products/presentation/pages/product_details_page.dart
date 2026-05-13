import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:go_router/go_router.dart';
import 'package:peng_cafe/config/route/routes_manager.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/constant/font_constants.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/resource/common_state_widget/error_state_widget.dart';
import 'package:peng_cafe/core/resource/common_state_widget/no_data_state_widget.dart';
import 'package:peng_cafe/core/resource/image_widget.dart';
import 'package:peng_cafe/core/util/helper/helper.dart';
import 'package:peng_cafe/features/products/data/models/product_model.dart';
import 'package:peng_cafe/features/products/presentation/bloc/get_products_bloc.dart';
import 'package:peng_cafe/features/products/presentation/widgets/product_widget.dart';
import 'package:peng_cafe/generated/locale_keys.g.dart';

class ProductDetailsPage extends StatelessWidget {
  final int productId;
  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final ProductModel productModel = ProductModel(
      locale: Helper.getCountryCode(context),
      id: productId,
    );
    return BlocProvider(
      create: (context) =>
          getItInstance<GetProductsBloc>()
            ..add(GetProductsEvent.getProduct(productModel: productModel)),
      child: BlocBuilder<GetProductsBloc, GetProductsState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(child: CircularProgressIndicator()),
            loading: () => Center(child: CircularProgressIndicator()),
            loaded: (data) => ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: productId,
                        child:
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: 700.h,
                                maxWidth: 700.w,
                              ),

                              child: ImageWidget(
                                height: 700.h,
                                boxFit: BoxFit.contain,
                                imageUrl: data.first.imagePath ?? "",
                              ),
                            ).asGlass(
                              border: Theme.of(context).defaultBorderSide,
                              clipBorderRadius: BorderRadiusGeometry.circular(
                                20.r,
                              ),
                            ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(start: 20.w),
                          child:
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20.h,
                                  horizontal: 20.w,
                                ),
                                child: Text(
                                  LocaleKeys.productsPage_description.tr(
                                    namedArgs: {
                                      "description":
                                          (data.first.description != null &&
                                              data
                                                      .first
                                                      .description
                                                      ?.isNotEmpty ==
                                                  true)
                                          ? data.first.description ?? ""
                                          : LocaleKeys.common_noThingToShow
                                                .tr(),
                                    },
                                  ),
                                  style: Theme.of(context).textTheme.labelLarge
                                      ?.copyWith(
                                        fontSize: 32.sp,
                                        fontFamily: FontConstants.fontFamily(
                                          context.locale,
                                        ),
                                      ),
                                ),
                              ).asGlass(
                                border: Theme.of(context).defaultBorderSide,
                                clipBorderRadius: BorderRadiusGeometry.circular(
                                  20.r,
                                ),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child:
                      Container(
                        height: 100.h,
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                LocaleKeys.productsPage_productName.tr(
                                  namedArgs: {"name": data.first.name ?? ""},
                                ),
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(
                                      fontSize: 28.sp,
                                      fontFamily: FontConstants.fontFamily(
                                        context.locale,
                                      ),
                                    ),
                              ),
                              Text(
                                "${LocaleKeys.productsPage_addProductForm_costPrice.tr()}: ${data.first.costPrice}",
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(
                                      fontSize: 28.sp,
                                      fontFamily: FontConstants.fontFamily(
                                        context.locale,
                                      ),
                                    ),
                              ),
                              Text(
                                "${LocaleKeys.productsPage_addProductForm_price.tr()}: ${data.first.price}",
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(
                                      fontSize: 28.sp,
                                      fontFamily: FontConstants.fontFamily(
                                        context.locale,
                                      ),
                                    ),
                              ),
                              Text(
                                "${LocaleKeys.productsPage_addProductForm_quantity.tr()}: ${data.first.quantity}",
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(
                                      fontSize: 28.sp,
                                      fontFamily: FontConstants.fontFamily(
                                        context.locale,
                                      ),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ).asGlass(
                        border: Theme.of(context).defaultBorderSide,
                        clipBorderRadius: BorderRadiusGeometry.circular(20.r),
                      ),
                ),
              ],
            ),
            noData: () => NodataStateWidget(),
            error: (e) => ErrorStateWidget(),
          );
        },
      ),
    );
  }
}
