import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/widgets/column_spacer.dart';
import 'package:orta/widgets/widgets_all.dart';

import '../utils/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
const List<String> cities = [
  "Almaty",
  "Astana",
  "Shymkent",
  "Taraz",
  "Aktau",
  "Kyzylorda",
  "Aktobe",
  "Oral",
  "Semei",
  "Oskemen",
  "Kokshetau",
];
int tag = 1;
List<String> tags = [];

class _ProfilePageState extends State<ProfilePage> {

  bool isLoading = false;
  String uid = '';
  var userData = {};
  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;

      final User user = auth.currentUser!;
      uid = user.uid;

      var userSnap =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      userData = userSnap.data()!;

      setState(() {});
    } catch (e) {
      showSnackBar(
        e.toString(),
        context,
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  void initState() {
    getData();
    super.initState();
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    String dropdownValue = userData['city']==null?cities.first:userData['cities'];
    List<dynamic> interests = userData['interest']==null?["list"]:userData['interest']; 
    print(userData['username']);
    print(userData['interest']);
    print(userData['city']);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const ColumnSpacer(3),
            Center(
                child: Column(
              children: [
                profilePhoto(),
                const ColumnSpacer(1.5),
                Text(
                  userData['username'] == null?"username":userData['username'],
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const ColumnSpacer(1),
                Text(userData['email']==null?"email":userData['email']),
                const ColumnSpacer(1.5),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: Styles.greyColor,
                  ),
                  child: const Text("Edit"),
                ),
              ],
            )),
            const ColumnSpacer(3),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Styles.greyColor),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: DropdownButton<String>(
                value: dropdownValue,
                underline: const SizedBox(),
                icon: const Padding(
                  padding: EdgeInsets.only(left: 250),
                  child: Icon(Icons.arrow_downward),
                ),
                elevation: 16,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: cities.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(value),
                    ),
                  );
                }).toList(),
              ),
            ),
            const ColumnSpacer(3),
            Text(
              "Қызығушылықтар",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const ColumnSpacer(2),
            ChipsChoice<String>.multiple(
              
              choiceItems: C2Choice.listFrom(
                  source: interests, value: (i, v) => v, label: (i, v) => v),
              choiceActiveStyle: C2ChoiceStyle(
                color: Colors.black,
                borderColor: Styles.greyColorButton,
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              choiceStyle: const C2ChoiceStyle(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              wrapped: true, onChanged: (List<String> value) {  }, value: [],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16))),
          width: double.infinity,
          child: ElevatedButton(
            
            onPressed: () {  },
          child: const Text("Edit")),
        ),
      ),
    );
    
  }
}
