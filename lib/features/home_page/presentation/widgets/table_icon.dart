import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/enums/tables_enum/table_type_enum.dart';

class TableIcon extends StatelessWidget {
  final TableTypeEnum tableType;
  final double? size;
  const TableIcon({super.key, required this.tableType, this.size});

  @override
  Widget build(BuildContext context) {
    IconData iconData = Icons.table_bar;
    switch (tableType) {
      case TableTypeEnum.cafe:
        iconData = Icons.table_bar;
        break;
      case TableTypeEnum.pool:
        iconData = Icons.pool;
        break;
      case TableTypeEnum.videoGame:
        iconData = Icons.videogame_asset;
        break;
      case TableTypeEnum.fisha:
        iconData = Icons.smoking_rooms;
        break;
      case TableTypeEnum.tableBall:
        iconData = Icons.sports_soccer;
        break;
      case TableTypeEnum.takeAway:
        iconData = Icons.shopping_bag;
        break;
    }
    return Icon(iconData, size: size ?? 40.sp);
  }
}
