// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreServices {
//   final _firestore = FirebaseFirestore.instance;

//   final String collectionPath;
//   late final CollectionReference _collectionReference;
//   FirestoreServices({required this.collectionPath}) {
//     _collectionReference = _firestore.collection(collectionPath);
//   }

//   //create
//   Future<void> create({String? id, required final data}) async {
//     await _collectionReference
//         .doc(id)
//         .set(data.toJson())
//         .onError((e, _) => print("Error writing document: $e"));
//   }

//   //read
//   Stream<List> read({String? id}) {
//     if (id != null) {
//       return _collectionReference
//           .doc(id)
//           .snapshots()
//           .map((event) => [event.data()]);
//     }
//     return _collectionReference.snapshots().map((snapshots) => snapshots.docs);
//   }

//   //update
//   Future<void> update({required String id, required final data}) async {
//     create(id: id, data: data);
//   }

//   //delete
//   Future<void> delete(String id) async {
//     await _collectionReference.doc(id).delete();
//   }

//   //create new collection
//   Future<void> createNewCollection(String collectionName) async {
//     await _firestore
//         .collection(collectionName)
//         .doc("firstOne")
//         .set({"onlyForCreation": "yes"});
//     delete("firstOne");
//   }
// }
