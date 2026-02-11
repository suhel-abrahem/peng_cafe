import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

class ImageStorageHelper {
  static Future<String?> saveProductImage(File? image) async {
    if (image == null) return null;

    final directory = await getApplicationDocumentsDirectory();
    final imagesDir = Directory(p.join(directory.path, 'images', 'products'));

    if (!await imagesDir.exists()) {
      await imagesDir.create(recursive: true);
    }

    final extension = p.extension(image.path);
    final fileName = 'product_${const Uuid().v4()}$extension';

    final savedImage = await image.copy(p.join(imagesDir.path, fileName));

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
