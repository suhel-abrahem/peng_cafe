import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peng_cafe/core/constant/language_constants.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/resource/custom_widget/snake_bar_widget/snake_bar_widget.dart';
import 'package:peng_cafe/features/products/domain/entities/product_entity.dart';
import 'package:peng_cafe/features/products/presentation/bloc/update_product_bloc.dart';
import 'package:peng_cafe/features/products/presentation/widgets/product_description_fields_widget.dart';

import '../../../../core/constant/font_constants.dart';
import '../../../../core/enums/product_type_enum/product_type_enum.dart';
import '../../../../core/resource/custom_widget/custom_input_field/custom_input_field.dart';
import '../../../../core/resource/custom_widget/dropdown/drop_down_with_label.dart';
import '../../../../core/resource/custom_widget/image_drop_picker/image_drop_picker.dart';
import '../../../../core/util/validator/validator.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../data/models/product_model.dart';

class UpdateProductForm extends StatefulWidget {
  final ProductEntity? productEntity;
  final ValueChanged<bool> onUpdated;
  const UpdateProductForm({
    super.key,
    required this.productEntity,
    required this.onUpdated,
  });

  @override
  State<UpdateProductForm> createState() => _UpdateProductFormState();
}

class _UpdateProductFormState extends State<UpdateProductForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  ProductModel productModel = ProductModel();
  File? imagePath;
  String? arName;
  String? enName;
  String? kuName;
  String? costPrice;
  String? price;
  String? discount;
  String? quantity;
  ProductTypeEnum? productType = ProductTypeEnum.foodAndBeverage;
  TextEditingController arDescriptionController = TextEditingController();
  TextEditingController enDescriptionController = TextEditingController();
  TextEditingController kuDescriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();

    if (widget.productEntity?.imagePath != null ||
        widget.productEntity?.imagePath?.isNotEmpty == true) {
      imagePath = File(widget.productEntity?.imagePath ?? "");
    }

    costPrice = widget.productEntity?.costPrice.toString();
    price = widget.productEntity?.price.toString();
    if (discount != null || discount?.isNotEmpty == true) {
      discount = widget.productEntity?.discount.toString();
    }

    quantity = widget.productEntity?.quantity.toString();

    productType = widget.productEntity?.productType;
    productModel = productModel.copyWith(id: widget.productEntity?.id);
  }

  @override
  Widget build(BuildContext context) {
    if (context.locale == LanguageConstant.arLoacle) {
      arName = widget.productEntity?.name;
      arDescriptionController.text = widget.productEntity?.description ?? "";
    } else if (context.locale == LanguageConstant.enLoacle) {
      enName = widget.productEntity?.name;
      enDescriptionController.text = widget.productEntity?.description ?? "";
    } else {
      kuName = widget.productEntity?.name;
      kuDescriptionController.text = widget.productEntity?.description ?? "";
    }
    return BlocProvider(
      create: (context) =>
          getItInstance<UpdateProductBloc>()..add(UpdateProductEvent.started()),
      child: BlocListener<UpdateProductBloc, UpdateProductState>(
        listener: (context, state) {
          print("update state: $state");
          state.maybeWhen(
            error: (message) {
              showMessage(
                message: message ?? "something Wrong",
                context: context,
              );
            },
            updated: () {
              Navigator.pop(context);
              widget.onUpdated(true);
            },
            orElse: () {},
          );
        },
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SizedBox(
            width: 900.w,
            height: 700.h,
            child: ListView(
              shrinkWrap: true,
              children: [
                //product names
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: 16.h,
                    horizontal: 16.w,
                  ),
                  child: Text(
                    LocaleKeys.productsPage_addProductForm_productNames.tr(),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontFamily: FontConstants.fontFamily(context.locale),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //ar name
                      CustomInputField(
                        width: 250.w,
                        height: 50.h,
                        isRequired: true,
                        label: LocaleKeys.productsPage_addProductForm_nameAr
                            .tr(),
                        validator: (value) {
                          if (value == null ||
                              value.toString().trim().isEmpty) {
                            return LocaleKeys.validation_requiredField.tr();
                          }
                          return null;
                        },
                        onChanged: (value) {
                          arName = value;
                        },
                        initialValue: arName,
                      ),
                      //en name
                      CustomInputField(
                        width: 250.w,
                        height: 50.h,
                        label: LocaleKeys.productsPage_addProductForm_nameEn
                            .tr(),
                        isRequired: false,
                        onChanged: (value) {
                          enName = value;
                        },
                        initialValue: enName,
                      ),
                      //ku name
                      CustomInputField(
                        initialValue: kuName,
                        width: 250.w,
                        height: 50.h,
                        label: LocaleKeys.productsPage_addProductForm_nameKu
                            .tr(),
                        isRequired: false,
                        onChanged: (value) {
                          kuName = value;
                        },
                      ),
                    ],
                  ),
                ),
                // price and quantity
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 16.w,
                  ),
                  child: Text(
                    LocaleKeys
                        .productsPage_addProductForm_priceAndQuantityAndType
                        .tr(),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontFamily: FontConstants.fontFamily(context.locale),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      //cost price
                      CustomInputField(
                        initialValue: costPrice,
                        width: 150.w,
                        height: 50.h,
                        isRequired: false,
                        enabled:
                            productModel.productType ==
                            ProductTypeEnum.foodAndBeverage,
                        label: LocaleKeys.productsPage_addProductForm_costPrice
                            .tr(),
                        validator: (value) {
                          if (value != null &&
                              value.toString().trim().isNotEmpty) {
                            if ((double.tryParse(value.toString()) == null) ||
                                (double.tryParse(value.toString()) ?? 0) <= 0) {
                              return LocaleKeys.validation_price.tr();
                            }
                          }

                          return null;
                        },
                        onChanged: (value) {
                          costPrice = value;
                        },
                      ),
                      //price
                      CustomInputField(
                        initialValue: price,
                        width: 150.w,
                        height: 50.h,
                        isRequired: true,
                        label: LocaleKeys.productsPage_addProductForm_price
                            .tr(),
                        validator: (value) {
                          if (value == null ||
                              value.toString().trim().isEmpty) {
                            return LocaleKeys.validation_requiredField.tr();
                          }
                          if (double.tryParse(value.toString()) == null) {
                            return LocaleKeys.validation_price.tr();
                          }
                          return null;
                        },
                        onChanged: (value) {
                          price = value;
                        },
                      ),
                      //discount
                      CustomInputField(
                        initialValue: discount,
                        width: 150.w,
                        height: 50.h,
                        isRequired: false,
                        label: LocaleKeys.productsPage_addProductForm_discount
                            .tr(),
                        validator: (value) {
                          if (value != null &&
                              value.toString().trim().isNotEmpty) {
                            if ((double.tryParse(value.toString()) == null) ||
                                (double.tryParse(value.toString()) ?? 0.0) <
                                    0.0) {
                              return LocaleKeys.validation_price.tr();
                            }
                          }
                          return null;
                        },
                        onChanged: (value) {
                          discount = value;
                        },
                      ),
                      //quantity
                      CustomInputField(
                        initialValue: quantity,
                        key: ValueKey("quantity_${productModel.productType}"),
                        width: 150.w,
                        height: 50.h,
                        enabled:
                            productModel.productType ==
                            ProductTypeEnum.foodAndBeverage,
                        isRequired:
                            productType == ProductTypeEnum.foodAndBeverage,
                        label: LocaleKeys.productsPage_addProductForm_quantity
                            .tr(),
                        validator: (value) {
                          if (productType == ProductTypeEnum.foodAndBeverage) {
                            if (!RegExp(
                              Validator.numberRegex,
                            ).hasMatch(value.toString().trim())) {
                              return LocaleKeys.validation_price.tr();
                            }
                          }
                          return null;
                        },
                        onChanged: (value) {
                          quantity = value;
                        },
                      ),
                      //type
                      DropDownWithLabel(
                        items: ProductTypeEnum.values,
                        label: LocaleKeys.productsPage_addProductForm_type.tr(),
                        labelPadding: EdgeInsetsDirectional.only(
                          bottom: 8.h,
                          end: 8.w,
                        ),
                        onChange: (newValue) {
                          productType = newValue;
                          setState(() {});
                        },
                        stringConverter: (value) {
                          switch (value) {
                            case ProductTypeEnum.foodAndBeverage:
                              return LocaleKeys
                                  .productsPage_addProductForm_foodAndBeverage
                                  .tr();
                            case ProductTypeEnum.games:
                              return LocaleKeys
                                  .productsPage_addProductForm_games
                                  .tr();
                          }
                        },
                        dropDownWidth: 150.w,
                        dropDownHeight: 50.h,
                        isLoading: false,
                        value: productType,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 16.w,
                  ),
                  child: Text(
                    LocaleKeys.productsPage_addProductForm_image.tr(),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontFamily: FontConstants.fontFamily(context.locale),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 400.w,
                      height: 200.h,
                      child: ImageDropPicker(
                        onImageSelected: (value) {
                          imagePath = value;
                        },
                        initialImage: imagePath,
                      ),
                    ),
                    SizedBox(
                      width: 400.w,
                      height: 200.h,
                      child: ProductDescriptionFields(
                        arController: arDescriptionController,
                        enController: enDescriptionController,
                        kuController: kuDescriptionController,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: BlocBuilder<UpdateProductBloc, UpdateProductState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState?.validate() ?? false) {
                                print("yup");
                                productModel = productModel.copyWith(
                                  descriptionAr: arDescriptionController.text,
                                  descriptionEn: enDescriptionController.text,
                                  descriptionKu: kuDescriptionController.text,
                                  nameAr: arName,
                                  nameEn: enName,
                                  nameKu: kuName,
                                  price: double.tryParse(price ?? "0") ?? 0,
                                  quantity:
                                      double.tryParse(quantity ?? "0") ?? 0,
                                  imagePath: imagePath,
                                  costPrice:
                                      double.tryParse(costPrice ?? "0") ?? 0,
                                  discount:
                                      double.tryParse(discount ?? "0") ?? 0,
                                  productType: productType,
                                );
                                context.read<UpdateProductBloc>().add(
                                  UpdateProductEvent.update(productModel),
                                );
                              }
                            },
                            child: Center(
                              child: state.maybeMap(
                                orElse: () => Text(
                                  LocaleKeys.common_edit.tr(),
                                  style: TextStyle(
                                    fontFamily: FontConstants.fontFamily(
                                      context.locale,
                                    ),
                                  ),
                                ),
                                loading: (value) => SizedBox(
                                  width: 30.w,
                                  height: 30.h,
                                  child: const CircularProgressIndicator(),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: state.maybeWhen(
                              orElse: () => Text(
                                LocaleKeys.common_close.tr(),
                                style: TextStyle(
                                  fontFamily: FontConstants.fontFamily(
                                    context.locale,
                                  ),
                                ),
                              ),
                              loading: () => Center(
                                child: SizedBox(
                                  width: 30.w,
                                  height: 30.h,
                                  child: const CircularProgressIndicator(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
