import 'dart:io';

import 'package:peng_cafe/core/util/app_directories.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

import 'image_compression_helper.dart';

class ImageStorageHelper {
  static Future<String?> saveProductImage(
    File? image, {
    String folder = "products",
  }) async {
    if (image == null) return null;

    final compressed = await ImageCompressionHelper.compressImage(image);

    final directory = await AppDirectories.imagesDir;
    final imagesDir = Directory(p.join(directory.path, folder));

    if (!await imagesDir.exists()) {
      await imagesDir.create(recursive: true);
    }

    final extension = p.extension(compressed.path);
    final fileName =
        '${folder}_${DateTime.now().millisecondsSinceEpoch}_${const Uuid().v4()}$extension';

    final savedImage = await compressed.copy(p.join(imagesDir.path, fileName));

    return savedImage.path;
  }

  static Future<void> deleteImage(String? path) async {
    if (path == null) return;

    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }
  }
}
