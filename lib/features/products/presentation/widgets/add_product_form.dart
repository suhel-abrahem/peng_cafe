import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/resource/custom_widget/custom_input_field/custom_input_field.dart';
import 'package:peng_cafe/core/resource/custom_widget/snake_bar_widget/snake_bar_widget.dart';
import 'package:peng_cafe/features/products/data/models/product_model.dart';
import 'package:peng_cafe/features/products/presentation/bloc/add_product_bloc.dart';

import '../../../../core/constant/font_constants.dart';

import '../../../../core/resource/custom_widget/image_drop_picker/image_drop_picker.dart';
import '../../../../core/util/helper/helper.dart';
import '../../../../generated/locale_keys.g.dart';

class AddProductForm extends StatelessWidget {
  final ValueChanged<bool>? onProductAdded;
  const AddProductForm({super.key, this.onProductAdded});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    ProductModel productModel = ProductModel(
      locale: Helper.getCountryCode(context),
    );
    return BlocProvider<AddProductBloc>(
      create: (context) =>
          getItInstance<AddProductBloc>()..add(AddProductEvent.started()),
      child: BlocListener<AddProductBloc, AddProductState>(
        listener: (context, state) {
          if (state is AddProductStateSuccess) {
            if (onProductAdded != null) {
              onProductAdded!(true);
            }
            Navigator.of(context).pop();
          } else if (state is AddProductStateError) {
            if (onProductAdded != null) {
              onProductAdded!(false);
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
            height: 800.h,
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
                    LocaleKeys.productsPage_addProductForm_priceAndQuantity
                        .tr(),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontFamily: FontConstants.fontFamily(context.locale),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //price
                      CustomInputField(
                        width: 250.w,
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
                      //quantity
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 16.w),
                        child: CustomInputField(
                          width: 250.w,
                          height: 50.h,
                          isRequired: true,
                          label: LocaleKeys.productsPage_addProductForm_quantity
                              .tr(),
                          validator: (value) {
                            if (value == null ||
                                value.toString().trim().isEmpty) {
                              return LocaleKeys.validation_requiredField.tr();
                            }
                            if (int.tryParse(value.toString()) == null) {
                              return LocaleKeys.validation_quantity.tr();
                            }
                            return null;
                          },
                          onChanged: (value) {
                            productModel = productModel.copyWith(
                              quantity: int.tryParse(value.toString()) ?? 0,
                            );
                          },
                        ),
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
                Center(
                  child: SizedBox(
                    width: 500.w,
                    height: 200.h,
                    child: ImageDropPicker(
                      onImageSelected: (value) {
                        productModel = productModel.copyWith(imagePath: value);
                      },
                      initialImage: productModel.imagePath,
                    ),
                  ),
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
                                context.read<AddProductBloc>().add(
                                  AddProductEvent.addProduct(
                                    productModel: productModel,
                                  ),
                                );
                              }
                            },
                            child: state is AddProductStateLoading
                                ? const CircularProgressIndicator()
                                : Text(
                                    LocaleKeys.productsPage_add.tr(),
                                    style: TextStyle(
                                      fontFamily: FontConstants.fontFamily(
                                        context.locale,
                                      ),
                                    ),
                                  ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: state is AddProductStateLoading
                                ? const CircularProgressIndicator()
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
