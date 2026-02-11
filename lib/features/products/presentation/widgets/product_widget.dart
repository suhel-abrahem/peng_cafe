import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/resource/image_widget.dart';
import 'package:peng_cafe/features/products/domain/entities/product_entity.dart';

import '../../../../core/constant/font_constants.dart';
import '../../../../generated/locale_keys.g.dart';

class ProductWidget extends StatelessWidget {
  final ProductEntity? productEntity;
  final bool? canSelect;
  final ValueChanged<ProductEntity>? onSelect;
  const ProductWidget({
    super.key,
    this.productEntity,
    this.canSelect = false,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child:
          Container(
            decoration: BoxDecoration(color: Colors.transparent),
            child: Column(
              children: [
                //image
                Expanded(
                  flex: 2,
                  child: ImageWidget(imageUrl: productEntity?.imagePath ?? ""),
                ),
                //name
                Text(
                  LocaleKeys.productsPage_productName.tr(
                    namedArgs: {"name": productEntity?.name ?? ""},
                  ),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontFamily: FontConstants.fontFamily(context.locale),
                  ),
                ),
                //price
                Text(
                  LocaleKeys.productsPage_price.tr(
                    namedArgs: {"price": productEntity?.price.toString() ?? ""},
                  ),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontFamily: FontConstants.fontFamily(context.locale),
                  ),
                ),
                //quantity
                Text(
                  LocaleKeys.productsPage_quantity.tr(
                    namedArgs: {
                      "quantity": productEntity?.quantity.toString() ?? "",
                    },
                  ),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontFamily: FontConstants.fontFamily(context.locale),
                  ),
                ),
              ],
            ),
          ).asGlass(
            blurX: 10,
            blurY: 10,
            border: Theme.of(context).defaultBorderSide,
            clipBorderRadius: BorderRadius.circular(20.r),
          ),
    );
  }
}
