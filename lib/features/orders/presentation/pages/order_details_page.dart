import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peng_cafe/core/enums/order_type_enum/order_type_enum.dart';

import 'package:peng_cafe/core/injection_container.dart';

import 'package:peng_cafe/core/util/helper/helper.dart';

import 'package:peng_cafe/features/table_page/presentation/bloc/table_page_bloc.dart';

import '../../../../core/enums/tables_enum/table_type_enum.dart';

import '../../../../core/resource/main_page/main_page.dart';

import '../../../../core/resource/printing_service.dart';
import '../../../table_page/presentation/widgets/order_area.dart';
import '../../../table_page/presentation/widgets/products_area.dart';

class OrderDetailsPage extends StatefulWidget {
  final int orderId;
  final TableTypeEnum tableType;
  final int tableNumber;
  final OrderTypeEnum orderType;
  const OrderDetailsPage({
    super.key,
    required this.orderId,
    required this.tableType,
    required this.tableNumber,
    required this.orderType,
  });

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    final String? locale = Helper.getCountryCode(context);

    return MainPage(
      body: BlocProvider(
        create: (context) => getItInstance<TablePageBloc>()
          ..add(
            TablePageEvent.loadTable(
              orderId: widget.orderId,
              tableNumber: widget.tableNumber,
              tableType: widget.tableType,
              orderType: widget.orderType,
              isEditing: true,
              userId: 0,
              locale: locale ?? "ar",
            ),
          ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 900;

              return isWide
                  ? AnimatedSwitcher(
                      duration: const Duration(milliseconds: 600),

                      child: Row(
                        key: ValueKey("isWide_$isEditing"),
                        children: [
                          Expanded(
                            flex: 3,
                            child: OrderArea(
                              tableType: widget.tableType,
                              isOrderDetails: true,
                              onEditModeChanged: (value) =>
                                  setState(() => isEditing = value),
                              editingMode: isEditing,
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Visibility(
                            visible: isEditing,
                            child: Expanded(
                              flex: 2,
                              child: ProductsArea(tableType: widget.tableType),
                            ),
                          ),
                        ],
                      ),
                    )
                  : AnimatedSwitcher(
                      duration: const Duration(milliseconds: 600),
                      child: Column(
                        key: ValueKey("isNotWide_${isEditing}"),
                        children: [
                          Expanded(
                            child: OrderArea(
                              tableType: widget.tableType,
                              isOrderDetails: true,
                              onEditModeChanged: (value) =>
                                  setState(() => isEditing = value),
                              editingMode: isEditing,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Visibility(
                            visible: isEditing,
                            child: Expanded(
                              child: ProductsArea(tableType: widget.tableType),
                            ),
                          ),
                        ],
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
