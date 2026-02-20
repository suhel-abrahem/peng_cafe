import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/extensions/selection_state_extension.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/resource/common_state_widget/error_state_widget.dart';
import 'package:peng_cafe/core/resource/common_state_widget/no_data_state_widget.dart';
import 'package:peng_cafe/core/resource/custom_widget/snake_bar_widget/snake_bar_widget.dart';
import 'package:peng_cafe/core/resource/main_page/main_page.dart';
import 'package:peng_cafe/core/util/helper/helper.dart';
import 'package:peng_cafe/features/products/data/models/product_model.dart';
import 'package:peng_cafe/generated/locale_keys.g.dart';

import '../../../../core/constant/font_constants.dart';
import '../../../../core/resource/selection_bloc/bloc/selection_bloc.dart';
import '../bloc/delete_product_bloc.dart';
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
      body: MultiBlocProvider(
        providers: [
          BlocProvider<GetProductsBloc>(
            create: (context) => getItInstance<GetProductsBloc>()
              ..add(GetProductsEvent.getProducts(productsModel: productModel)),
          ),
          BlocProvider(
            create: (context) =>
                getItInstance<DeleteProductBloc>()
                  ..add(DeleteProductEvent.started()),
          ),
          BlocProvider(
            create: (context) =>
                getItInstance<SelectionBloc>()
                  ..add(const SelectionEvent.exitSelectionMode()),
          ),
        ],
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
                        Builder(
                          builder: (context) {
                            return ElevatedButton(
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) => Center(
                                    child: SizedBox(
                                      height: 800.h,
                                      child: AlertDialog(
                                        backgroundColor: Theme.of(dialogContext)
                                            .scaffoldBackgroundColor
                                            .withValues(alpha: 0.66),
                                        title: Text(
                                          LocaleKeys.productsPage_addProduct
                                              .tr(),
                                          style: TextStyle(
                                            fontFamily:
                                                FontConstants.fontFamily(
                                                  dialogContext.locale,
                                                ),
                                          ),
                                        ),
                                        content: Center(
                                          child: AddProductForm(
                                            onProductAdded: (value) {
                                              if (value) {
                                                context.read<GetProductsBloc>().add(
                                                  const GetProductsEvent.getProducts(),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
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
                            );
                          },
                        ),

                        //delete and edit row with selections
                        BlocBuilder<SelectionBloc, SelectionState>(
                          builder: (context, state) {
                            return Row(
                              children: [
                                //select button
                                IconButton(
                                  onPressed: () {
                                    state.isSelectMode
                                        ? context.read<SelectionBloc>().add(
                                            const SelectionEvent.exitSelectionMode(),
                                          )
                                        : context.read<SelectionBloc>().add(
                                            const SelectionEvent.enterSelectionMode(),
                                          );
                                  },
                                  icon: Icon(
                                    state.isSelectMode
                                        ? Icons.close_rounded
                                        : Icons.check_rounded,
                                  ),
                                  tooltip: LocaleKeys.productsPage_selectProduct
                                      .tr(),
                                ),
                                //select all button
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      state.isSelectAll
                                          ? context.read<SelectionBloc>().add(
                                              const SelectionEvent.exitSelectionMode(),
                                            )
                                          : context.read<SelectionBloc>().add(
                                              const SelectionEvent.toggleSelectAll(),
                                            );
                                    },
                                    icon: Icon(
                                      state.isSelectAll
                                          ? Icons.checklist_rounded
                                          : Icons.checklist_rtl_rounded,
                                    ),
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
                                  padding: EdgeInsetsDirectional.only(
                                    start: 20.w,
                                  ),
                                  child: BlocListener<DeleteProductBloc, DeleteProductState>(
                                    listener: (context, state) {
                                      state.maybeMap(
                                        orElse: () => null,
                                        error: (value) => showMessage(
                                          message: LocaleKeys.common_error.tr(),
                                          context: context,
                                        ),
                                        success: (value) {
                                          showMessage(
                                            message: LocaleKeys.common_success
                                                .tr(),

                                            context: context,
                                          );
                                          context.read<GetProductsBloc>().add(
                                            const GetProductsEvent.getProducts(),
                                          );
                                          context.read<SelectionBloc>().add(
                                            const SelectionEvent.exitSelectionMode(),
                                          );
                                        },
                                      );
                                    },
                                    child: BlocBuilder<DeleteProductBloc, DeleteProductState>(
                                      builder: (context, deleteState) {
                                        return IconButton(
                                          onPressed:
                                              deleteState
                                                  is DeleteProductStateCanDelete
                                              ? () {
                                                  final selection = context
                                                      .read<SelectionBloc>()
                                                      .state;
                                                  final deleteBloc = context
                                                      .read<
                                                        DeleteProductBloc
                                                      >();

                                                  if (selection.isSelectAll) {
                                                    if (selection
                                                        .excludedIds
                                                        .isEmpty) {
                                                      //  Delete ALL
                                                      deleteBloc.add(
                                                        const DeleteProductEvent.deleteAll(),
                                                      );
                                                    } else {
                                                      //  Delete ALL except excluded
                                                      deleteBloc.add(
                                                        DeleteProductEvent.deleteAllExceptExcluded(
                                                          selection.excludedIds
                                                              .toList(),
                                                        ),
                                                      );
                                                    }
                                                  } else {
                                                    //  Delete selected only
                                                    deleteBloc.add(
                                                      DeleteProductEvent.deleteSelected(
                                                        selection.selectedIds
                                                            .toList(),
                                                      ),
                                                    );
                                                  }
                                                }
                                              : null,
                                          icon: Icon(Icons.delete_rounded),
                                          tooltip: LocaleKeys
                                              .productsPage_delete
                                              .tr(),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ).asGlass(
                    tintColor: Theme.of(context).scaffoldBackgroundColor,
                    blurX: 10,
                    blurY: 10,
                    frosted: true,
                    border: Theme.of(context).defaultBorderSide,
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
                  int crossAxisCount = (constraints.maxWidth / 300).ceil();
                  return BlocBuilder<GetProductsBloc, GetProductsState>(
                    builder: (context, state) {
                      return state.maybeMap(
                        orElse: () => ErrorStateWidget(),
                        loaded: (value) =>
                            BlocBuilder<SelectionBloc, SelectionState>(
                              builder: (context, selectionState) {
                                return BlocListener<
                                  SelectionBloc,
                                  SelectionState
                                >(
                                  listener: (context, state) {
                                    final canDelete =
                                        state.effectiveSelectedCount(
                                          value.products.length,
                                        ) >
                                        0;

                                    final deleteBloc = context
                                        .read<DeleteProductBloc>();

                                    if (canDelete &&
                                        deleteBloc.state
                                            is! DeleteProductStateCanDelete) {
                                      deleteBloc.add(
                                        const DeleteProductEvent.canDelete(),
                                      );
                                    } else if (!canDelete &&
                                        deleteBloc.state
                                            is! DeleteProductStateInitial) {
                                      deleteBloc.add(
                                        const DeleteProductEvent.started(),
                                      );
                                    }
                                  },
                                  child: GridView.builder(
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
                                      print(
                                        "product id: //${value.products[index]}",
                                      );
                                      return ProductWidget(
                                        canSelect:
                                            selectionState.isSelectMode ||
                                            selectionState.isSelectAll,
                                        onSelect: (_) =>
                                            context.read<SelectionBloc>().add(
                                              SelectionEvent.toggleProduct(
                                                value.products[index].id ?? 0,
                                              ),
                                            ),
                                        isSelected: selectionState.isSelected(
                                          value.products[index].id ?? 0,
                                        ),
                                        productEntity: value.products[index],
                                      );
                                    },
                                  ),
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
