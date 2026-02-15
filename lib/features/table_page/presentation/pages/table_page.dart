import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:peng_cafe/config/theme/app_theme.dart';
import 'package:peng_cafe/core/injection_container.dart';
import 'package:peng_cafe/core/resource/main_page/main_page.dart';
import 'package:peng_cafe/features/table_page/presentation/bloc/table_page_bloc.dart';

import '../widgets/order_area.dart';
import '../widgets/products_area.dart';

class TablePage extends StatelessWidget {
  final int tableNumber;
  final int userId;

  const TablePage({super.key, required this.tableNumber, required this.userId});

  @override
  Widget build(BuildContext context) {
    return MainPage(
      body: BlocProvider(
        create: (context) => getItInstance<TablePageBloc>()
          ..add(
            TablePageEvent.loadTable(
              tableNumber: tableNumber,
              userId: 1, // replace with logged user id
            ),
          ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 900;

              return isWide
                  ? Row(
                      children: [
                        Expanded(flex: 3, child: OrderArea()),
                        SizedBox(width: 20.w),
                        Expanded(flex: 2, child: ProductsArea()),
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(child: OrderArea()),
                        SizedBox(height: 20.h),
                        Expanded(child: ProductsArea()),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
