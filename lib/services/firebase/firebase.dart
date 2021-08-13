import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getFirestoreCollection(
      {required String collectionName}) {
    return _firestore.collection(collectionName).get();
  }
}

FirebaseServices firebaseServices = FirebaseServices();
