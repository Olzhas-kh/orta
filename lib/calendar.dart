import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:orta/resources/app_styles.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Event>> getData() async {
  List<Event> events = [];

  final snapshot = await FirebaseFirestore.instance.collection('events').get();

  snapshot.docs.forEach((document) {
    final data = document.data();
    Timestamp timeStamp = data["eventDate"];
    DateTime dateTime = timeStamp.toDate();
int year = dateTime.year;
int month = dateTime.month;
int day = dateTime.day;
    final event = Event(
 child: Text("Asdasdad"), dateTime: CalendarDateTime(year: year, month: month, day: day, calendarType:  CalendarType.GREGORIAN,),
    );
    events.add(event);
  });

  return events;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Calendar'),
      ),
      body: FutureBuilder<List<Event>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return EventCalendar(
              calendarType: CalendarType.GREGORIAN,
                      calendarLanguage: 'en',
                      headerOptions: HeaderOptions(
                          weekDayStringType: WeekDayStringTypes.SHORT),
                      dayOptions: DayOptions(
                        selectedBackgroundColor: Styles.greyColor,
                        weekDaySelectedColor: Colors.black,
                      ),
                      eventOptions: EventOptions(
                        loadingWidget: () {
                          return Container();
                        },
                      ),
                      onChangeDateTime: (p0) {},
                      calendarOptions:
                          CalendarOptions(viewType: ViewType.DAILY),
              events: snapshot.data!,
             
            );
          } else {
            return Center(child: Text('No events found'));
          }
        },
      ),
    );
  }
}
