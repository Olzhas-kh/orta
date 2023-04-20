import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String password;
  final String city;
  final List<String> interest;
  final bool gender;
  final String birthDay;

  const UserModel({
    required this.email,
    required this.uid,
    required this.name,
    required this.city,
    required this.interest,
    required this.password,
    required this.gender,
    required this.birthDay,
  });

  Map<String, dynamic> toJson() => {
        "username": name,
        "uid": uid,
        "email": email,
        "city": city,
        "interest": interest,
        "telephone": gender,
        "adress": birthDay,
        "password": password,
      };

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      name: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      password: snapshot['password'],
      city: snapshot['city'],
      interest: snapshot['interest'],
      gender: snapshot['telephone'],
      birthDay: snapshot['adress'],
    );
  }
}
