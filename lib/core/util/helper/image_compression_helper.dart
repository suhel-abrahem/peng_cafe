import 'dart:io';
import 'package:image_compression_flutter/image_compression_flutter.dart';
import 'package:path/path.dart' as p;

class ImageCompressionHelper {
  static Future<File> compressImage(
    File file, {
    int quality = 70,
    int maxWidth = 1200,
  }) async {
    final input = ImageFile(
      filePath: file.path,
      rawBytes: file.readAsBytesSync(),
    );

    final config = ImageFileConfiguration(
      input: input,
      config: const Configuration(quality: 70, outputType: ImageOutputType.jpg),
    );

    final output = await compressor.compress(config);

    final compressedFile = File(
      p.join(file.parent.path, 'compressed_${p.basename(file.path)}'),
    );

    await compressedFile.writeAsBytes(output.rawBytes);

    return compressedFile;
  }
}
