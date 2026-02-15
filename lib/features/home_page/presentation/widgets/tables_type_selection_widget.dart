import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/enums/tables_enum/table_type_enum.dart';
import 'package:peng_cafe/features/home_page/presentation/widgets/table_icon.dart';
import 'package:peng_cafe/features/setting/domain/entities/tables_setting_entity/tables_quantity_entity.dart';

import '../../../../core/constant/font_constants.dart';
import '../bloc/home_tables_bloc.dart';

class TablesTypeSelectionWidget extends StatelessWidget {
  final TablesQuantityEntity table;

  const TablesTypeSelectionWidget({super.key, required this.table});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<HomeTablesBloc>().add(
          HomeTablesEvent.selectTableType(table.tableName),
        );
      },
      child:
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  table.tableName == TableTypeEnum.pool
                      ? Text(
                          "🎱",
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                fontFamily: FontConstants.fontFamily(
                                  context.locale,
                                ),
                                overflow: TextOverflow.ellipsis,
                                fontSize: 80.sp,
                              ),
                        )
                      : TableIcon(tableType: table.tableName, size: 80.sp),
                  Text(
                    table.tableName.displayName.tr(),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontFamily: FontConstants.fontFamily(context.locale),
                      overflow: TextOverflow.ellipsis,
                      fontSize: 32.sp,
                    ),
                  ),
                ],
              ),
            ),
          ).asGlass(
            tintColor: Theme.of(context).scaffoldBackgroundColor,
            clipBorderRadius: BorderRadius.circular(20),
            frosted: true,
            border: Theme.of(context).defaultBorderSide,
            blurX: 10,
            blurY: 10,
          ),
    );
  }
}
