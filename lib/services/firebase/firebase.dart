import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nss_tracker/model/user_model.dart' as userModel;

class FirestoreServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getFirestoreCollection(
      {required String collectionName}) {
    return _firestore.collection(collectionName).get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getFirestoreDocument(
      {required String collectioName, required String documentID}) async {
    return _firestore.collection(collectioName).doc(documentID).get();
  }
}

class FirebaseAuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late final GoogleSignIn _googleUser = GoogleSignIn();

  Stream<User?> isSignedIn() {
    return _firebaseAuth.userChanges();
  }

  Future<userModel.User> getUserModel() async {
    final docSnapshot = await firestoreServices.getFirestoreDocument(
        collectioName: "users", documentID: _firebaseAuth.currentUser!.uid);
    return userModel.User(
        uid: _firebaseAuth.currentUser!.uid,
        displayName: docSnapshot["name"],
        attendance: docSnapshot["attendance"],
        email: docSnapshot["email"],
        longestStreak: docSnapshot["longest_streaks"],
        photoURL: docSnapshot["photo_url"],
        streak: docSnapshot["streaks"]);
  }

  Future<userModel.User> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return getUserModel();
    } on FirebaseAuthException catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> signOutFromGoogle() async {
    await _googleUser.signOut();
    await _firebaseAuth.signOut();
  }
}

FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices();
FirestoreServices firestoreServices = FirestoreServices();
