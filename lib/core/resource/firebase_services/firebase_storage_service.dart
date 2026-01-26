// import 'dart:io';
// import 'dart:typed_data';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path_provider/path_provider.dart';

// class FirebaseStorageService {
//   final storageRef = FirebaseStorage.instance.ref();

//   //create file
//   Future<void> createFile(
//       {required Uint8List data, required String path}) async {
//     // Get the temporary directory
//     Directory tempDir = await getTemporaryDirectory();
//     String tempPath = tempDir.path;
//     File tempFile = File('$tempPath/temp_image.png');
//     tempFile.createSync();
//     // Write the image data to the temporary file
//     await tempFile.writeAsBytes(data, mode: FileMode.write);

//     final ref = storageRef.child(path);

//     await ref.putFile(tempFile, SettableMetadata(contentType: "image/png"));

//     // TaskSnapshot taskSnapshot =
//     //     await uploadTask.whenComplete(() => print("finish"));
//   }

//   //read
//   Future<Uint8List?> readFile(String path) async {
//     final ref = storageRef.child(path);
//     final Uint8List? data = await ref.getData();
//     return data;
//   }

//   //delete
//   Future<void> delete(String path) async {
//     final ref = storageRef.child(path);

//     await ref.delete();
//   }
// }
