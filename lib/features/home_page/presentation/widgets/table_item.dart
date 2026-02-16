import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:peng_cafe/core/constant/font_constants.dart';
import 'package:peng_cafe/features/home_page/presentation/widgets/table_icon.dart';

import '../../../../config/route/routes_manager.dart';
import '../../../../core/enums/tables_enum/table_type_enum.dart';

class TableItem extends StatelessWidget {
  final TableTypeEnum tableType;
  final int index;
  const TableItem({super.key, required this.tableType, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          RoutesName.tablePage,
          pathParameters: {
            "tableNumber": index.toString(),
            "tableType": tableType.name,
          },
        );
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.white30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            tableType == TableTypeEnum.pool
                ? Text(
                    "🎱",
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium?.copyWith(fontSize: 40.sp),
                  )
                : TableIcon(tableType: tableType, size: 40.sp),
            SizedBox(height: 8.h),
            Text(
              "Table $index",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontFamily: FontConstants.fontFamily(context.locale),
                fontSize: 32.sp,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
