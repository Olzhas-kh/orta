import 'dart:developer';

 import 'package:cloud_firestore/cloud_firestore.dart';
 import 'package:firebase_auth/firebase_auth.dart';
 import 'package:flutter/material.dart';
 import 'package:flutter_event_calendar/flutter_event_calendar.dart';
 import 'package:orta/resources/app_styles.dart';
 import 'package:orta/screens/event_info.dart';
 import 'package:orta/widgets/column_spacer.dart';
 import 'package:orta/widgets/my_events_widget.dart';
 import 'package:intl/intl.dart';

 import '../../services/var_for_register.dart';
 import '../../widgets/row_spacer.dart';

 class MyEventsPage extends StatefulWidget {
   const MyEventsPage({super.key});

    @override
   State<MyEventsPage> createState() => _MyEventsPageState();
 }

   final FirebaseFirestore _db = FirebaseFirestore.instance;

   Future<List<Map<String, dynamic>>> getAllDocData(String collectionName) async {
     List<Map<String, dynamic>> docDataList = [];
     QuerySnapshot snapshot =
       await FirebaseFirestore.instance.collection(collectionName).get();
     snapshot.docs.forEach((doc) {
       docDataList.add(doc.data() as Map<String, dynamic>);
     });
     log(docDataList[0]['eventId']);
     return docDataList;
   }

 class _MyEventsPageState extends State<MyEventsPage> {

   bool isLoading = false;
   String uid = '';
   var userData = {};

   Future<List<Event>> getData() async {
     List<Event> events = [];

     final FirebaseAuth auth = FirebaseAuth.instance;
     final User user = auth.currentUser!;
     uid = user.uid;

     final snapshot =
         await FirebaseFirestore.instance.collection('events').where('uid', isEqualTo: uid).get();

     snapshot.docs.forEach((document) {
       final data = document.data();
       Timestamp timeStamp = data["eventDate"];
       DateTime dateTime = timeStamp.toDate();
       int year = dateTime.year;
       int month = dateTime.month;
       int day = dateTime.day;
       String eventFormattedDate = DateFormat('dd/MM/yyyy')
           .format((data['eventDate'] as Timestamp).toDate());
       final event = Event(
         child: ListView.separated(
           itemCount: 1,
           physics: const NeverScrollableScrollPhysics(),
           shrinkWrap: true,
           itemBuilder: (context, index) => GestureDetector(
               onTap: () {
                 VarForEventId.eventId = data['eventId'];
                 VarForEventId.uid = data['uid'];
                 // print(data['eventId']);
                 Navigator.of(context).push(
                   MaterialPageRoute(builder: (context) => const EventInfo()),
                 );
               },
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   children: [
                     Container(
                       height: 120,
                       width: 120,
                       decoration: BoxDecoration(
                         borderRadius:
                             const BorderRadius.all(Radius.circular(11)),
                         color: Styles.greyDark,
                         image: DecorationImage(
                         fit: BoxFit.fill,
                         image: NetworkImage(data['eventPhotoUrl'].toString())
                         ),
                       ),
                     ),
                     const RowSpacer(2),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                          Text(eventFormattedDate),
                         const ColumnSpacer(1),
                         Text(
                           data['name'],
                           style: Theme.of(context)
                               .textTheme
                               .titleMedium
                               ?.copyWith(fontWeight: FontWeight.w700),
                         ),
                         const ColumnSpacer(0.5),
                          Text(data['format'],),
                         const ColumnSpacer(1.5),
                         Container(
                           decoration: BoxDecoration(
                               borderRadius:
                                   const BorderRadius.all(Radius.circular(8)),
                               color: Styles.greyDark),
                           child: Padding(
                             padding: const EdgeInsets.all(7.0),
                             child: Row(
                               children: [
                                 const Icon(
                                   Icons.description,
                                   size: 10,
                                 ),
                                 const RowSpacer(0.5),
                                 Text(
                                  data['format'],
                                   style: Theme.of(context).textTheme.bodySmall,
                                 )
                               ],
                             ),
                           ),
                         ),
                       ],
                     ),
                     const Spacer(),
                     Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children:  [
                         Text('${data['price']} tg'),
                         const ColumnSpacer(7.5),
                         const Text(""),
                       ],
                     )
                   ],
                 ),
               )),
           separatorBuilder: (_, __) => const Divider(),
         ),
         dateTime: CalendarDateTime(
           year: year,
           month: month,
           day: day,
           calendarType: CalendarType.GREGORIAN,
         ),
       );
       events.add(event);
     });

     return events;
   }

   var data;
   late Stream<QuerySnapshot> _dataStream;

   @override
   void initState() {
     getAllDocData("events");
     super.initState();
     _dataStream = FirebaseFirestore.instance.collection('events').snapshots();

     log(_dataStream.first.toString());
   }
@override
   Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Styles.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Styles.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Іс-шаралар",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Styles.black),
            ),
           ],
         ),
       ),
       body: StreamBuilder<QuerySnapshot>(
         stream: _dataStream,
           builder:
               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
       return Padding(
         padding: const EdgeInsets.symmetric(horizontal: 16),
         child: Column(
           children: [
            const ColumnSpacer(2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: Styles.greyLight),
                  child: const Text("Өткен"),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: Styles.greyDark),
                  child: const Text("Алдағы"),
                ),
              ],
             ),
             const ColumnSpacer(3),
             Expanded(
              child: FutureBuilder<List<Event>>(
                   future: getData(),
                   builder: (context, snapshot) {
                         if (snapshot.connectionState ==
                             ConnectionState.waiting) {
                           return Center(child: CircularProgressIndicator());
                         } else if (snapshot.hasData) {
                           return ListView.separated(
                                     shrinkWrap: true,
                                     physics: const NeverScrollableScrollPhysics(),
                                     itemCount: snapshot.data!.length,
                                     separatorBuilder: (_, __) => const Divider(),
                                     itemBuilder: (context, int index) {
                                       final event = snapshot.data![index];
                                       return GestureDetector(
                                         onTap: () {
                                             Navigator.of(context).push(
                                             MaterialPageRoute(
                                               builder: (context) => const EventInfo()),
                               );
                             },
                             child: event.child,
                             );
                       },
                     );
                         } else {
                           return Center(child: Text('No events found'));
                         }
                       }
                     ),
                       ),
           ],
         ),
       );
               }
       ),
     );
   }
 }