import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String uid;
  String displayName;
  int attendance;
  int streak;
  String email;
  int longestStreak;
  String photoURL;

  User(
      {required this.uid,
      required this.displayName,
      required this.attendance,
      required this.email,
      required this.longestStreak,
      required this.photoURL,
      required this.streak});
}
