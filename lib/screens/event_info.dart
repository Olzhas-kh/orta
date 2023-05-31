import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orta/models/event_model.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/screens/events.dart';
import 'package:orta/services/var_for_register.dart';
import 'package:orta/widgets/column_spacer.dart';
import 'package:orta/widgets/row_spacer.dart';
import 'package:intl/intl.dart';

import '../blocs/bloc/events_bloc.dart';
import '../utils/utils.dart';

class EventInfo extends StatefulWidget {
  const EventInfo({super.key});

  @override
  State<EventInfo> createState() => _EventInfoState();
}

int tag = 1;
List<String> tags = [];

class _EventInfoState extends State<EventInfo> {

  bool isLoading = false;
  var eventData = {};
  String eventId ='';
  String uid = '';
  String currentUid = '';
  var userData = {};
  
  getData() async {
    
    try {
      eventId = VarForEventId.eventId.toString();
      uid = VarForEventId.uid.toString();

      var snapshot = 
        await FirebaseFirestore.instance.collection('events').doc(eventId).get();
      var snapshotUser = 
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
      currentUid = FirebaseAuth.instance.currentUser!.uid;
      // print(uid);
      eventData = snapshot.data()!;

      userData = snapshotUser.data()!;

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
    String userName = userData['username']==null?"username":userData['username'];

      print(userName);
    List<dynamic> interests = eventData['interest']==null?["design"]:eventData['interest']; 
    List<dynamic> participants_current = eventData['participants_list']==null?[]:eventData['participants_list'];
    var participants_limit = eventData['count']==null?0:eventData['count'];

    int unixTime = 1621071556; // example Unix timestamp value
    Timestamp timestampExeption = Timestamp.fromMillisecondsSinceEpoch(unixTime * 1000);
    Timestamp timeStamp = eventData["eventDate"]==null?timestampExeption:eventData["eventDate"];
    Timestamp startTime = eventData['startTime']==null?timestampExeption:eventData["startTime"];
    Timestamp endTime = eventData['endTime']==null? timestampExeption:eventData["endTime"];
      DateTime dateTime = timeStamp.toDate();
      DateTime startDateTime = startTime.toDate();
      DateTime endDateTime = endTime.toDate();
      int year = dateTime.year;
      int month = dateTime.month;
      int day = dateTime.day;
      int startTimeH = startDateTime.hour;
      int startTimeM = startDateTime.minute;
      int endTimeH = endDateTime.hour;
      int endTimeM = endDateTime.minute;
      String eventFormattedDate = DateFormat('dd/MM/yyyy')
          .format(timeStamp.toDate());

          
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Styles.greyColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Spacer(),
                    Text(eventData['format']==null?"format":eventData['format']),
                    const ColumnSpacer(0.8),
                    Text(
                      eventData['name']==null?"name":eventData['name'],
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Styles.black, fontWeight: FontWeight.bold),
                    ),
                    const ColumnSpacer(0.8),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: 120,
                      decoration: BoxDecoration(
                          color: Styles.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(17))),
                      child: const Center(child: Text("design")),
                    ),
                  ]),
            ),
          ),
          const ColumnSpacer(1.5),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            color: Styles.greyColor, shape: BoxShape.circle),
                      ),
                      const RowSpacer(1),
                      Column(
                        children: [
                          Text(
                            "Ұйымдастырушы",
                            style: TextStyle(color: Styles.greyColor),
                          ),
                          Text(userName),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          const ColumnSpacer(2),
                          Row(
                            children:  [
                              Text(eventData['count']==null?"0":eventData['count'].toString()),
                              RowSpacer(0.5),
                              Icon(Icons.people),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const ColumnSpacer(0.5),
                  const Divider(),
                  const ColumnSpacer(0.5),
                  Text(
                    "О мероприятия",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const ColumnSpacer(1.5),
                  Text(
                      eventData['description']==null?"description":eventData['description']),
                  const ColumnSpacer(0.5),
                  Divider(),
                  const ColumnSpacer(0.5),
                  Row(
                    children:  [
                      Icon(
                        Icons.calendar_month,
                        size: 20,
                      ),
                      RowSpacer(0.5),
                      Text(eventFormattedDate)
                    ],
                  ),
                  const ColumnSpacer(0.5),
                  Row(
                    children: const [
                      Icon(
                        Icons.timelapse,
                        size: 20,
                      ),
                      RowSpacer(0.5),
                      Text("19:00 - 21:00 ")
                    ],
                  ),
                  ColumnSpacer(0.5),
                  Row(
                    children:  [
                      Icon(
                        Icons.location_on,
                        size: 20,
                      ),
                      RowSpacer(0.5),
                      Text(eventData['location']==null?"location":eventData['location']),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      )
                    ],
                  ),
                  ColumnSpacer(0.5),
                  Divider(),
                  ColumnSpacer(0.5),
                  Text("Подходит для..."),
                  ChipsChoice<String>.multiple(
                    choiceItems: C2Choice.listFrom(
                        source: interests,
                        value: (i, v) => v,
                        label: (i, v) => v),
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
                    wrapped: true,
                    onChanged: (List<String> value) {},
                    value: [],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Text(eventData['price']==null?"0":eventData['price'].toString(), 
                      style: Theme.of(context).textTheme.headlineSmall,),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  color: Styles.greyColor,
                ),
                child: GestureDetector(
                  onTap: () {
                    DocumentReference eventRef = FirebaseFirestore.instance.collection('events').doc(eventId);
                    // Check if the list size exceeds a limit
                    if (participants_current.length > participants_limit) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Event Full"),
                            content: Text("The event is already full. No more participants can join."),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // Add the current user to the participants list
                      eventRef.update({
                        'participants_list': FieldValue.arrayUnion([currentUid])
                      }).then((_) {
                        // Success message or navigation
                      }).catchError((error) {
                        // Error handling
                      });
                    }
                  },
                  child: Text("Қатысу"),
                ),
              )
            ],
          )),
    );
  }
}
