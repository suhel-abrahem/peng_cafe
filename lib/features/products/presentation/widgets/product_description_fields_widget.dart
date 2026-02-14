import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/resource/custom_widget/custom_input_field/custom_input_field.dart';

import '../../../../core/constant/font_constants.dart';
import '../../../../generated/locale_keys.g.dart';
import 'dart:ui' as ui;

class ProductDescriptionFields extends StatefulWidget {
  final TextEditingController? arController;
  final TextEditingController? enController;
  final TextEditingController? kuController;

  const ProductDescriptionFields({
    super.key,
    this.arController,
    this.enController,
    this.kuController,
  });

  @override
  State<ProductDescriptionFields> createState() =>
      _ProductDescriptionFieldsState();
}

class _ProductDescriptionFieldsState extends State<ProductDescriptionFields> {
  String selectedLanguage = LocaleKeys.productsPage_addProductForm_descriptionAr
      .tr();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              _languageSelectionButton(
                context,
                LocaleKeys.productsPage_addProductForm_descriptionAr.tr(),
              ),
              SizedBox(width: 10.w),
              _languageSelectionButton(
                context,
                LocaleKeys.productsPage_addProductForm_descriptionEn.tr(),
              ),
              SizedBox(width: 10.w),
              _languageSelectionButton(
                context,
                LocaleKeys.productsPage_addProductForm_descriptionKu.tr(),
              ),
            ],
          ),
          Expanded(child: Container()),
          Visibility(
            visible:
                selectedLanguage ==
                LocaleKeys.productsPage_addProductForm_descriptionAr.tr(),
            child: _field(
              context,
              controller: widget.arController,
              label: LocaleKeys.productsPage_addProductForm_descriptionAr.tr(),
              textDirection: ui.TextDirection.rtl,
            ),
          ),

          Visibility(
            visible:
                selectedLanguage ==
                LocaleKeys.productsPage_addProductForm_descriptionEn.tr(),
            child: _field(
              context,
              controller: widget.enController,
              label: LocaleKeys.productsPage_addProductForm_descriptionEn.tr(),
              textDirection: ui.TextDirection.ltr,
            ),
          ),
          Visibility(
            visible:
                selectedLanguage ==
                LocaleKeys.productsPage_addProductForm_descriptionKu.tr(),
            child: _field(
              context,
              controller: widget.kuController,
              label: LocaleKeys.productsPage_addProductForm_descriptionKu.tr(),
              textDirection: ui.TextDirection.rtl,
            ),
          ),
        ],
      ),
    ).asGlass(
      tintColor: Theme.of(context).scaffoldBackgroundColor,
      clipBorderRadius: BorderRadius.circular(20.r),
      border: Theme.of(context).defaultBorderSide,
      blurX: 10,
      blurY: 10,
      frosted: true,
    );
  }

  Widget _field(
    BuildContext context, {
    required TextEditingController? controller,
    required String label,
    required ui.TextDirection textDirection,
  }) {
    return CustomInputField(
      controller: controller,
      fillColor: Colors.transparent,
      maxLines: 4,
      textDirection: textDirection,
    );
  }

  Widget _languageSelectionButton(BuildContext context, String language) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedLanguage = language;
        });
      },
      child:
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Text(
              language,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontFamily: FontConstants.fontFamily(context.locale),
              ),
            ),
          ).asGlass(
            tintColor: Theme.of(context).scaffoldBackgroundColor,
            clipBorderRadius: BorderRadius.circular(10.r),
            border: Theme.of(context).defaultBorderSide?.copyWith(
              color: selectedLanguage == language
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).defaultBorderSide.color,
            ),
            blurX: 5,
            blurY: 5,
            frosted: true,
          ),
    );
  }
}
