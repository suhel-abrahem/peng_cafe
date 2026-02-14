import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peng_cafe/core/enums/product_type_enum/product_type_enum.dart';
import 'package:peng_cafe/core/enums/psition_enum.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/resource/custom_widget/custom_input_field/custom_input_field.dart';
import 'package:peng_cafe/core/resource/custom_widget/dropdown/drop_down_with_label.dart';
import 'package:peng_cafe/core/resource/custom_widget/snake_bar_widget/snake_bar_widget.dart';
import 'package:peng_cafe/core/resource/validator.dart';
import 'package:peng_cafe/features/products/data/models/product_model.dart';
import 'package:peng_cafe/features/products/presentation/bloc/add_product_bloc.dart';
import 'package:peng_cafe/features/products/presentation/widgets/product_description_fields_widget.dart';

import '../../../../core/constant/font_constants.dart';

import '../../../../core/resource/custom_widget/image_drop_picker/image_drop_picker.dart';
import '../../../../core/util/helper/helper.dart';
import '../../../../generated/locale_keys.g.dart';

class AddProductForm extends StatefulWidget {
  final ValueChanged<bool>? onProductAdded;
  const AddProductForm({super.key, this.onProductAdded});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  ProductModel productModel = ProductModel();
  TextEditingController arDescriptionController = TextEditingController();
  TextEditingController enDescriptionController = TextEditingController();
  TextEditingController kuDescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    productModel = productModel.copyWith(
      locale: Helper.getCountryCode(context),
    );
    return BlocProvider<AddProductBloc>(
      create: (context) =>
          getItInstance<AddProductBloc>()..add(AddProductEvent.started()),
      child: BlocListener<AddProductBloc, AddProductState>(
        listener: (context, state) {
          if (state is AddProductStateSuccess) {
            if (widget.onProductAdded != null) {
              widget.onProductAdded!(true);
            }
            Navigator.of(context).pop();
          } else if (state is AddProductStateItemsAlreadyExists) {
            if (widget.onProductAdded != null) {
              widget.onProductAdded!(false);
            }

            showMessage(
              message: LocaleKeys.validation_thereIsAlreadyAnItemWithThisName
                  .tr(),
              context: context,
            );
          } else if (state is AddProductStateError) {
            if (widget.onProductAdded != null) {
              widget.onProductAdded!(false);
            }
            showMessage(
              message: LocaleKeys.common_error.tr(),
              context: context,
            );
          }
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
                          productModel = productModel.copyWith(nameAr: value);
                        },
                      ),
                      //en name
                      CustomInputField(
                        width: 250.w,
                        height: 50.h,
                        label: LocaleKeys.productsPage_addProductForm_nameEn
                            .tr(),
                        isRequired: false,
                        onChanged: (value) {
                          productModel = productModel.copyWith(nameEn: value);
                        },
                      ),
                      //ku name
                      CustomInputField(
                        width: 250.w,
                        height: 50.h,
                        label: LocaleKeys.productsPage_addProductForm_nameKu
                            .tr(),
                        isRequired: false,
                        onChanged: (value) {
                          productModel = productModel.copyWith(nameKu: value);
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
                        width: 150.w,
                        height: 50.h,
                        isRequired: false,
                        enabled:
                            productModel.productType ==
                            ProductTypeEnum.foodAndBeverage,
                        label: LocaleKeys.productsPage_addProductForm_costPrice
                            .tr(),
                        validator: (value) {
                          if (!RegExp(
                            Validator.numberRegex,
                          ).hasMatch(value.toString().trim())) {
                            return LocaleKeys.validation_price.tr();
                          }

                          return null;
                        },
                        onChanged: (value) {
                          productModel = productModel.copyWith(
                            costPrice: double.tryParse(value.toString()) ?? 0,
                          );
                        },
                      ),
                      //price
                      CustomInputField(
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
                          productModel = productModel.copyWith(
                            price: double.tryParse(value.toString()) ?? 0,
                          );
                        },
                      ),
                      //discount
                      CustomInputField(
                        width: 150.w,
                        height: 50.h,
                        isRequired: false,
                        label: LocaleKeys.productsPage_addProductForm_discount
                            .tr(),
                        validator: (value) {
                          if (!RegExp(
                            Validator.numberRegex,
                          ).hasMatch(value.toString().trim())) {
                            return LocaleKeys.validation_price.tr();
                          }
                          return null;
                        },
                        onChanged: (value) {
                          productModel = productModel.copyWith(
                            discount: double.tryParse(value.toString()) ?? 0,
                          );
                        },
                      ),
                      //quantity
                      CustomInputField(
                        key: ValueKey("quantity_${productModel.productType}"),
                        width: 150.w,
                        height: 50.h,
                        enabled:
                            productModel.productType ==
                            ProductTypeEnum.foodAndBeverage,
                        isRequired:
                            productModel.productType ==
                            ProductTypeEnum.foodAndBeverage,
                        label: LocaleKeys.productsPage_addProductForm_quantity
                            .tr(),
                        validator: (value) {
                          if (productModel.productType ==
                              ProductTypeEnum.foodAndBeverage) {
                            if (!RegExp(
                              Validator.numberRegex,
                            ).hasMatch(value.toString().trim())) {
                              return LocaleKeys.validation_price.tr();
                            }
                          }
                          return null;
                        },
                        onChanged: (value) {
                          productModel = productModel.copyWith(
                            quantity: double.tryParse(value.toString()) ?? 0,
                          );
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
                          productModel = productModel.copyWith(
                            productType: newValue,
                          );
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
                        value: productModel.productType,
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
                          productModel = productModel.copyWith(
                            imagePath: value,
                          );
                        },
                        initialImage: productModel.imagePath,
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
                  child: BlocBuilder<AddProductBloc, AddProductState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState?.validate() ?? false) {
                                productModel = productModel.copyWith(
                                  descriptionAr: arDescriptionController.text,
                                  descriptionEn: enDescriptionController.text,
                                  descriptionKu: kuDescriptionController.text,
                                );
                                context.read<AddProductBloc>().add(
                                  AddProductEvent.addProduct(
                                    productModel: productModel,
                                  ),
                                );
                              }
                            },
                            child: Center(
                              child: state is AddProductStateLoading
                                  ? SizedBox(
                                      width: 30.w,
                                      height: 30.h,
                                      child: const CircularProgressIndicator(),
                                    )
                                  : Text(
                                      LocaleKeys.productsPage_add.tr(),
                                      style: TextStyle(
                                        fontFamily: FontConstants.fontFamily(
                                          context.locale,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: state is AddProductStateLoading
                                ? Center(
                                    child: SizedBox(
                                      width: 30.w,
                                      height: 30.h,
                                      child: const CircularProgressIndicator(),
                                    ),
                                  )
                                : Text(
                                    LocaleKeys.common_close.tr(),
                                    style: TextStyle(
                                      fontFamily: FontConstants.fontFamily(
                                        context.locale,
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
