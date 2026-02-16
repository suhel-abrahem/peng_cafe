import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/constant/font_constants.dart';

import 'package:peng_cafe/core/resource/main_page/main_page.dart';
import 'package:peng_cafe/features/home_page/presentation/widgets/tables_type_selection_widget.dart';

import 'package:peng_cafe/features/setting/presentation/bloc/tables_types_bloc.dart';
import 'package:peng_cafe/generated/locale_keys.g.dart';

import '../../../../core/enums/tables_enum/table_type_enum.dart';

import '../bloc/home_tables_bloc.dart';
import '../widgets/table_item.dart';
import 'package:animated_emoji/animated_emoji.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainPage(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                TablesTypesBloc()..add(const TablesTypesEvent.load()),
          ),
          BlocProvider(create: (context) => HomeTablesBloc()),
        ],
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return GridView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: constraints.maxWidth < 800 ? 2 : 1,
                  mainAxisSpacing: 20.w,
                  crossAxisSpacing: 20.h,

                  mainAxisExtent: constraints.maxWidth > 800
                      ? (constraints.maxWidth - 20.w) / 2
                      : constraints.maxWidth,
                ),
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: BlocBuilder<TablesTypesBloc, TablesTypesState>(
                      builder: (context, state) {
                        return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: constraints.maxWidth < 800
                                    ? 1
                                    : 3,
                                mainAxisSpacing: 20.h,
                                crossAxisSpacing: 20.w,
                              ),
                          itemBuilder: (context, index) {
                            return TablesTypeSelectionWidget(
                              table: state.tablesTypes.tablesTypes[index],
                            );
                          },
                          itemCount: state.tablesTypes.tablesTypes.length,
                        );
                      },
                    ),
                  ),
                  // tables container
                  BlocBuilder<HomeTablesBloc, HomeTablesState>(
                    builder: (context, homeState) {
                      if (homeState.selectedTable == null) {
                        return Center(
                          child: Text(
                            LocaleKeys.homePage_selectTableType.tr(),
                            style: Theme.of(context).textTheme.headlineLarge
                                ?.copyWith(
                                  fontFamily: FontConstants.fontFamily(
                                    context.locale,
                                  ),
                                  fontSize: 32.sp,
                                  overflow: TextOverflow.ellipsis,
                                ),
                          ),
                        );
                      }

                      final tablesTypes = context
                          .read<TablesTypesBloc>()
                          .state
                          .tablesTypes
                          .tablesTypes;

                      final selectedType = tablesTypes.firstWhere(
                        (e) => e.tableName == homeState.selectedTable,
                      );

                      final count = selectedType.quantity;

                      return (count < 1)
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AnimatedEmoji(AnimatedEmojis.sad, size: 300.sp),
                                Text(
                                  LocaleKeys.homePage_thereIsNoTableOfThisType
                                      .tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        fontFamily: FontConstants.fontFamily(
                                          context.locale,
                                        ),
                                        fontSize: 32.sp,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                ),
                              ],
                            )
                          : GridView.builder(
                              padding: EdgeInsets.all(20.w),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 20.h,
                                    crossAxisSpacing: 20.w,
                                  ),
                              itemCount: count,
                              itemBuilder: (context, index) {
                                return TableItem(
                                  tableType: selectedType.tableType,
                                  index: index + 1,
                                );
                              },
                            );
                    },
                  ).asGlass(
                    tintColor: Theme.of(context).scaffoldBackgroundColor,
                    clipBorderRadius: BorderRadius.circular(20.r),
                    border: Theme.of(context).defaultBorderSide,
                    blurX: 10,
                    blurY: 10,
                    frosted: true,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
