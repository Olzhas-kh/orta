import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orta/services/firebase_methods/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// Add events
  
  Future<String> addEvents(
    String uid, 
    String name, 
    String description,
    DateTime eventDate,
    DateTime startTime,
    DateTime endTime,
   String location,
   List<String> interest,
   int count,
   int price,
   String format ,
   Uint8List file,

   )
       async {
    String res = "Some error occurred";
      String eventPhotoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, true);
    try {
      if (uid.isNotEmpty) {
        // if the likes list contains the user uid, we need to remove it
        String eventId = const Uuid().v1();
        _firestore.collection('events').doc(eventId).set({
          'uid': uid,
          'eventId': eventId,
          'name': name,
          'description': description,
          'eventDate': eventDate,
          'startTime': startTime,
          'endTime': endTime,
          'location': location,
          'interest': interest,
          'count': count,
          'price': price,
          'format': format, 
          'eventPhotoUrl': eventPhotoUrl,

        }, SetOptions(merge: true));
        res = 'success';
      } else {
        res = "Please enter text";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

}


