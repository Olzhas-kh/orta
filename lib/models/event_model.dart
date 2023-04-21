import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String uid;
  final String eventId;
  final String name;
  final String description;
  final DateTime eventDate;
  final DateTime startTime;
  final DateTime endTime;
  final String location;
  final List<String> interest;
  final int count;
  final String format;
  final int  price;
  final String image;
  


  const EventModel({
    required this.uid,
    required this.eventId,
    required this.name,
    required this.description,
    required this.eventDate,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.interest,
    required this.count,
    required this.format,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        "uid":uid,
        "eventId": eventId,
        "name": name,
        "description": description,
        "eventDate": eventDate,
        "startTime": startTime,
        "endTime": endTime,
        "location": location,
        "interest": interest,
        "count": count,
        "format": format,
        "price": price,
        "image":image
    };

  static EventModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return EventModel(
      name: snapshot['name'],
      uid: snapshot['uid'],
      eventId: snapshot['eventId'],
      description: snapshot['description'],
      eventDate: snapshot['eventDate'],
      startTime: snapshot['startTime'],
      endTime: snapshot['endTime'],
      location: snapshot['location'],
      interest: snapshot['interest'],
      count: snapshot['count'],
      format:snapshot['format'],
      price: snapshot['price'],
      image: snapshot['image']
    );
  }
}
