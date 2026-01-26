// import 'dart:typed_data';

// import 'package:firebase_core/firebase_core.dart';

// import '../data_state.dart';
// import '../firebase_services/firebase_firestore_services.dart';
// import '../firebase_services/firebase_storage_service.dart';

// class CommonService {
//   Future<DataState<Stream<List>>> getDataFromFirestore({
//     required String collectionName,
//     String? id,
//   }) async {
//     FirestoreServices firestoreServices = FirestoreServices(
//       collectionPath: collectionName,
//     );

//     try {
//       Stream<List> response = firestoreServices.read(id: id);

//       return DataSuccess(data: response);
//     } catch (e) {
//       return DataFailed(error: e.toString());
//     }
//   }

//   Future<DataState<Uint8List?>> getFileFromStore(String path) async {
//     FirebaseStorageService firebaseStorageService = FirebaseStorageService();
//     try {
//       Uint8List? data;
//       await firebaseStorageService.readFile(path).then((value) => data = value);

//       return DataSuccess(data: data);
//     } on FirebaseException catch (e) {
//       return DataFailed(
//         error: "Error:Failed to download this file more info below:\n$e",
//       );
//     }
//   }

//   Future<DataState<void>> setDataToFirestore({
//     required String collectionName,
//     String? id,
//     required data,
//   }) async {
//     FirestoreServices firestoreServices = FirestoreServices(
//       collectionPath: collectionName,
//     );
//     try {
//       await firestoreServices.create(data: data, id: id);
//       print("data: $data, id: $id");
//       return const DataSuccess();
//     } catch (e) {
//       return DataFailed(error: e.toString());
//     }
//   }

//   Future<DataState<void>> setDataToStorage({
//     required String path,
//     required Uint8List? data,
//   }) async {
//     FirebaseStorageService firebaseStorageService = FirebaseStorageService();
//     try {
//       if (data != null) {
//         await firebaseStorageService.createFile(path: path, data: data);
//         return const DataSuccess();
//       } else {
//         return DataFailed(
//           error: "Error:Failed to upload this file because file not found",
//         );
//       }
//     } on FirebaseException catch (e) {
//       print("catch");
//       return DataFailed(
//         error: "Error:Failed to upload this file more info below:\n$e",
//       );
//     }
//   }

//   Future<DataState<void>> updateDataToFirestore({
//     required String collectionName,
//     required String id,
//     required data,
//   }) async {
//     FirestoreServices firestoreServices = FirestoreServices(
//       collectionPath: collectionName,
//     );
//     try {
//       await firestoreServices.update(data: data, id: id);
//       return const DataSuccess();
//     } catch (e) {
//       return DataFailed(error: e.toString());
//     }
//   }

//   Future<DataState<void>> deleteDataFromFirestore({
//     required String collectionName,
//     required String id,
//   }) async {
//     FirestoreServices firestoreServices = FirestoreServices(
//       collectionPath: collectionName,
//     );
//     try {
//       await firestoreServices.delete(id);
//       return const DataSuccess();
//     } catch (e) {
//       return DataFailed(error: e.toString());
//     }
//   }

//   Future<DataState<void>> deleteDataFromStorage(String path) async {
//     FirebaseStorageService firebaseStorageService = FirebaseStorageService();
//     try {
//       await firebaseStorageService.delete(path);
//       return const DataSuccess();
//     } on FirebaseException catch (e) {
//       return DataFailed(
//         error: "Error:Failed to delete this file more info below:\n$e",
//       );
//     }
//   }
// }
