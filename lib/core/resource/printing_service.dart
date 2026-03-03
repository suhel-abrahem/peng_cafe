import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:peng_cafe/features/orders/data/models/orders_section_model.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:flutter/services.dart';

import '../../features/table_page/domain/entities/order_entity.dart';
import '../../features/table_page/domain/entities/order_item_entity.dart';

class BillPrinter {
  static Future<void> printBill({
    required BuildContext context,
    required OrderEntity order,
    required List<OrderItemEntity> items,
    required double paidAmount,
    required double remaining,
  }) async {
    final pdf = pw.Document();

    // ✅ Load Arabic font
    final fontData = await rootBundle.load("assets/fonts/Amiri-Regular.ttf");
    final ttf = pw.Font.ttf(fontData);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.roll80,
        textDirection: pw.TextDirection.rtl,
        build: (pw.Context ctx) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(16),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'فاتورة الكافيه',
                  style: pw.TextStyle(font: ttf, fontSize: 18),
                ),
                pw.SizedBox(height: 10),
                pw.Text(
                  'الطاولة: ${order.tableNumber}',
                  style: pw.TextStyle(font: ttf),
                ),
                pw.Text(
                  'رقم الطلب: ${order.orderNumber}',
                  style: pw.TextStyle(font: ttf),
                ),
                pw.Divider(),

                ...items.map(
                  (e) => pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        e.productName ?? '',
                        style: pw.TextStyle(font: ttf),
                      ),

                      pw.Text(
                        '${e.quantity} × ${e.price}',
                        style: pw.TextStyle(font: ttf),
                      ),
                    ],
                  ),
                ),

                pw.Divider(),

                pw.Text(
                  'المجموع: ${items.fold(0.0, (s, e) => s + e.total)}',
                  style: pw.TextStyle(font: ttf, fontSize: 18),
                ),

                pw.Text('المدفوع: $paidAmount', style: pw.TextStyle(font: ttf)),

                pw.Text('الباقي: $remaining', style: pw.TextStyle(font: ttf)),
              ],
            ),
          );
        },
      ),
    );

    await Printing.layoutPdf(onLayout: (format) async => pdf.save());
  }

  static Future<void> printLastOrders({
    required BuildContext context,
    required List<OrdersSection> orders,
    required double totalRevenue,
  }) async {
    final pdf = pw.Document();

    // Load Arabic font
    final fontData = await rootBundle.load("assets/fonts/Amiri-Regular.ttf");
    final ttf = pw.Font.ttf(fontData);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        textDirection: pw.TextDirection.rtl,

        // Optional margins
        margin: const pw.EdgeInsets.all(16),

        // Repeated header on every page (optional)
        header: (ctx) => pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              'تقرير الطلبات الأخيرة',
              style: pw.TextStyle(font: ttf, fontSize: 14),
            ),
            pw.Text(
              'صفحة ${ctx.pageNumber} / ${ctx.pagesCount}',
              style: pw.TextStyle(font: ttf, fontSize: 12),
            ),
          ],
        ),

        // Repeated footer on every page (optional)
        footer: (ctx) => pw.Align(
          alignment: pw.Alignment.center,
          child: pw.Text(
            'إجمالي الإيراد: ${totalRevenue.toStringAsFixed(0)} د.ع',
            style: pw.TextStyle(font: ttf, fontSize: 12),
          ),
        ),

        build: (pw.Context ctx) {
          final widgets = <pw.Widget>[pw.SizedBox(height: 10)];

          for (final section in orders) {
            widgets.addAll([
              // Keep section title with at least one line below it
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    section.title.tr(),
                    style: pw.TextStyle(font: ttf, fontSize: 16),
                  ),
                  pw.SizedBox(height: 6),
                ],
              ),

              // Orders list (MultiPage will split automatically)
              ...section.orders.map((order) {
                final date =
                    '${order.createdAt.day}/${order.createdAt.month}/${order.createdAt.year}'
                    ' - ${order.createdAt.hour}:${order.createdAt.minute.toString().padLeft(2, '0')}';

                return pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(vertical: 3),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Expanded(
                        flex: 3,
                        child: pw.Text(
                          'الطاولة ${order.tableNumber} - ${order.orderNumber}',
                          style: pw.TextStyle(font: ttf, fontSize: 11),
                        ),
                      ),
                      pw.SizedBox(width: 8),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Text(
                          '${order.total} د.ع',
                          style: pw.TextStyle(font: ttf, fontSize: 11),
                          textAlign: pw.TextAlign.center,
                        ),
                      ),
                      pw.SizedBox(width: 8),
                      pw.Expanded(
                        flex: 3,
                        child: pw.Text(
                          date,
                          style: pw.TextStyle(font: ttf, fontSize: 10),
                          textAlign: pw.TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                );
              }),

              pw.Divider(),

              // Try to keep total line with divider (nice formatting)
              pw.Text(
                'إجمالي القسم: ${section.total} د.ع',
                style: pw.TextStyle(font: ttf, fontSize: 14),
              ),
              pw.SizedBox(height: 12),
            ]);
          }

          return widgets;
        },
      ),
    );

    await Printing.layoutPdf(onLayout: (_) async => pdf.save());
  }
}
