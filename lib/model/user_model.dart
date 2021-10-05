import 'package:flutter/material.dart';
import 'package:nss_tracker/services/firebase/firebase.dart';

class UserModel extends ChangeNotifier {
  String uid;
  String displayName;
  int attendance;
  int streak;
  String email;
  int longestStreak;

  UserModel(
      {required this.uid,
      required this.displayName,
      required this.attendance,
      required this.email,
      required this.longestStreak,
      required this.streak});

  Future<void> fetchUpdates() async {
    final user = await firebaseAuthServices.getUserModel();
    uid = user.uid;
    displayName = user.displayName;
    attendance = user.attendance;
    streak = user.streak;
    email = user.email;
    longestStreak = user.longestStreak;

    notifyListeners();
  }
}
