import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';

import 'package:peng_cafe/core/resource/image_widget.dart';
import 'package:peng_cafe/features/products/domain/entities/product_entity.dart';

import '../../../../core/constant/font_constants.dart';

import '../../../../core/util/helper/helper.dart';
import '../../../../generated/locale_keys.g.dart';

class ProductWidget extends StatelessWidget {
  final ProductEntity? productEntity;
  final bool? canSelect;
  final ValueChanged<void>? onSelect;
  final bool isSelected;
  final VoidCallback? onTaped;
  const ProductWidget({
    super.key,
    this.productEntity,
    this.canSelect = false,
    this.onSelect,
    required this.isSelected,
    this.onTaped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTaped,
      child:
          Container(
            decoration: BoxDecoration(color: Colors.transparent),
            child: Column(
              children: [
                //image
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Hero(
                              tag: productEntity?.id ?? 0,
                              child: ImageWidget(
                                isLocal: true,
                                width: double.infinity,
                                imageUrl: productEntity?.imagePath ?? "",
                                boxFit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: Visibility(
                            key: ValueKey("_${productEntity?.id}_$canSelect"),
                            visible: canSelect ?? false,
                            child: Checkbox(
                              onChanged: (value) => onSelect?.call(null),
                              value: isSelected,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //name
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Text(
                            LocaleKeys.productsPage_productName.tr(
                              namedArgs: {"name": productEntity?.name ?? ""},
                            ),
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  fontFamily: FontConstants.fontFamily(
                                    context.locale,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                          ),
                        ),
                      ),
                      //price
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Text(
                            LocaleKeys.productsPage_price.tr(
                              namedArgs: {
                                "price": Helper.formatPrice(
                                  productEntity?.price ?? 0,
                                ),
                              },
                            ),
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  fontFamily: FontConstants.fontFamily(
                                    context.locale,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                          ),
                        ),
                      ),
                      //quantity
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Text(
                            LocaleKeys.productsPage_quantity.tr(
                              namedArgs: {
                                "quantity":
                                    productEntity?.quantity.toString() ?? "",
                              },
                            ),
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  fontFamily: FontConstants.fontFamily(
                                    context.locale,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).asGlass(
            blurX: 10,
            blurY: 10,
            border: Theme.of(context).defaultBorderSide,
            tintColor: Theme.of(context).scaffoldBackgroundColor,
            frosted: true,
            clipBorderRadius: BorderRadius.circular(20.r),
          ),
    );
  }
}
