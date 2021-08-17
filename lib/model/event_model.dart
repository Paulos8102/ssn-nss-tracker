import 'package:flutter/material.dart';
import 'package:nss_tracker/services/Events/firestore_events.dart';

class Event {
  late String id;
  String name;
  DateTime startDateTime;
  String link;
  String organizer;
  String description;
  String instruction;
  bool isOnline;
  DateTime endDateTime;

  Event(
      {required this.id,
      required this.instruction,
      required this.name,
      required this.isOnline,
      required this.startDateTime,
      required this.endDateTime,
      required this.description,
      required this.link,
      required this.organizer});
}

class Events extends ChangeNotifier {
  List<Event> ongoingEvents = [];
  List<Event> upcomingEvents = [];

  Events({required this.ongoingEvents, required this.upcomingEvents});

  Future<void> updateEvents() async {
    Map<String, List<Event>> events = Map();
    events = await fetchEvents();
    ongoingEvents = events["ongoing_events"] as List<Event>;
    upcomingEvents = events["upcoming_events"] as List<Event>;
    notifyListeners();
  }
}
