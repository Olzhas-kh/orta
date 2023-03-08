// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';


// class FirebaseAuthentication {
//   static Future<FirebaseApp> initializeFireBase() async {
//     FirebaseApp firebaseApp = await Firebase.initializeApp();
//     return firebaseApp;
//   }

//   static Future<User?> googleSignIn({required BuildContext context}) async{
//     User? user;
//     FirebaseAuth auth = FirebaseAuth.instance;
//     // final GoogleSignIn googleSignIn = GoogleSignIn();
//     // final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

//     // if(googleSignInAccount != null){
//     //   final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
//     //   final AuthCredential credential = GoogleAuthProvider.credential(accessToken: googleSignInAuthentication.accessToken,
//     //       idToken: googleSignInAuthentication.idToken);
//     //   try {
//     //     final UserCredential userCredential = await auth.signInWithCredential(credential);
//     //     user = userCredential.user;
//     //   } on FirebaseException catch (e) {
//     //     if (e.code == 'account-exists-with-different-credentia') {
//     //       customToast(context,'The account already exists with a different credential.');
//     //     } else
//     //     if (e.code == 'invalid-credential') {
//     //       customToast(context,'Error occurred while accessing credentials. Try again.');
//     //     }
//     //   }catch(e){
//     //     customToast(context,'Error occurred using Google Sign-In. Try again.');
//     //   }
//     // }
//     // return user;
//   }

// //   static Future<void> signOut({required BuildContext context})async{
// // final  GoogleSignIn googleSignIn =  GoogleSignIn();
// // try{
// //   await googleSignIn.signOut();
// // } catch (e){
// //   customToast(context, 'Error signing out. Try again.');
// // }
// //   }
// }