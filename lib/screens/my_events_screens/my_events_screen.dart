import 'package:flutter/material.dart';
import 'package:orta/resources/app_styles.dart';
class MyEventsPage extends StatelessWidget {
  const MyEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        automaticallyImplyLeading: false,
        backgroundColor: Styles.blueColor,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const[
             Text("Іс-шаралар"),
          ],
        ),
        
      ),
      body: Container(),

    );
  }
}