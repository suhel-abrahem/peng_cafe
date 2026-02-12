import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class AppDirectories {
  static const String companyName = 'ByteX';
  static const String appName = 'ByteX_Cafe';

  static Future<Directory> get appRoot async {
    final documents = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(documents.path, companyName, appName));

    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  static Future<Directory> get databaseDir async {
    final root = await appRoot;
    final dir = Directory(p.join(root.path, 'database'));

    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  static Future<Directory> get imagesDir async {
    final root = await appRoot;
    final dir = Directory(p.join(root.path, 'images'));

    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }
}
