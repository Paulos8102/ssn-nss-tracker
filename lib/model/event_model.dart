import 'package:flutter/material.dart';
import 'package:nss_tracker/services/Events/firestore_events.dart';

class Event {
  late String id;
  String name;
  DateTime date;
  String organizer;
  String description;
  bool isOnline;
  String? meetLink;

  Event(
      {required this.id,
      required this.name,
      required this.isOnline,
      required this.date,
      required this.description,
      this.meetLink,
      required this.organizer});
}

class Events extends ChangeNotifier {
  List<Event> events = [];

  Events({required this.events});

  Future<void> fetchEvents() async {
    events = await FirestoreEvents.getFirestoreEvents();
    notifyListeners();
  }
}
