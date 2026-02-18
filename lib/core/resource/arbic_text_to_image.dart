import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

Future<img.Image> arabicTextToImage(String text) async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);

  final paint = Paint()..color = Colors.white;
  canvas.drawRect(const Rect.fromLTWH(0, 0, 500, 100), paint);

  final paragraphBuilder = ui.ParagraphBuilder(
    ui.ParagraphStyle(textDirection: TextDirection.rtl, fontSize: 32),
  )..addText(text);

  final paragraph = paragraphBuilder.build()
    ..layout(const ui.ParagraphConstraints(width: 500));

  canvas.drawParagraph(paragraph, const Offset(10, 10));

  final picture = recorder.endRecording();
  final image = await picture.toImage(500, 100);
  final bytes = await image.toByteData(format: ui.ImageByteFormat.png);

  return img.decodeImage(bytes!.buffer.asUint8List())!;
}
