import 'package:flutter/material.dart';
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
        textDirection: pw.TextDirection.rtl, // 🔥 مهم جدًا للعربي
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
}
