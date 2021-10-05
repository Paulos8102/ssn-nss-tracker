import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nss_tracker/model/event_model.dart';
import 'package:nss_tracker/services/firebase/firebase.dart';

class FirestoreEvents {
  static Future<List<Event>> getFirestoreEvents(String collectionName) async {
    List<Event> events = [];
    QuerySnapshot<Map<String, dynamic>> snapshot = await firestoreServices
        .getFirestoreCollection(collectionName: collectionName);
    List<QueryDocumentSnapshot> documentSnapshots = snapshot.docs;
    for (int i = 0; i < documentSnapshots.length; i++) {
      DateTime startDateTime = DateTime.parse(
          documentSnapshots[i].get("date_time").toDate().toString());
      DateTime endDateTime = DateTime.parse(
          documentSnapshots[i].get("end_date_time").toDate().toString());
      events.add(Event(
          // code: documentSnapshots[i].get("code"),
          id: documentSnapshots[i].id,
          endDateTime: endDateTime,
          instruction: documentSnapshots[i].get("instruction"),
          name: documentSnapshots[i].get("name"),
          isOnline: documentSnapshots[i].get("is_online"),
          link: documentSnapshots[i].get("link"),
          startDateTime: startDateTime,
          description: documentSnapshots[i].get("description"),
          organizer: ""));
    }

    return events;
  }

  static Future<void> updateAttendance(String userId, int newAttendance) async {
    firestoreServices.updateFirestoreDocument(
        collectionName: "users",
        documentID: userId,
        data: {'attendance': newAttendance});
  }
}

Future<Map<String, List<Event>>> fetchEvents() async {
  Map<String, List<Event>> events = Map();
  List<Event> ongoingEvents =
      await FirestoreEvents.getFirestoreEvents("ongoing_events");
  List<Event> upcomingEvents =
      await FirestoreEvents.getFirestoreEvents("events");
  events.putIfAbsent("ongoing_events", () => ongoingEvents);
  events.putIfAbsent("upcoming_events", () => upcomingEvents);

  return events;
}
