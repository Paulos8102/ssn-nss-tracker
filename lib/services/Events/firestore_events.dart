import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nss_tracker/model/event_model.dart';
import 'package:nss_tracker/services/firebase/firebase.dart';

class FirestoreEvents {
  static Future<List<Event>> getFirestoreEvents() async {
    List<Event> events = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firebaseServices.getFirestoreCollection(collectionName: "events");
    List<QueryDocumentSnapshot> documentSnapshots = snapshot.docs;
    for (int i = 0; i < documentSnapshots.length; i++) {
      DateTime dateTime = DateTime.parse(
          documentSnapshots[i].get("date_time").toDate().toString());
      events.add(Event(
          name: documentSnapshots[i].get("name"),
          isOnline: false,
          date: dateTime,
          description: documentSnapshots[i].get("description"),
          organizer: ""));
    }

    return events;
  }
}
