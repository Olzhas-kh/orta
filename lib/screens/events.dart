import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orta/resources/app_svg_images.dart';
import 'package:orta/services/var_for_register.dart';
import 'package:orta/widgets/widgets_all.dart';
import 'package:intl/intl.dart';

import '../resources/app_styles.dart';
import '../utils/utils.dart';
import '../widgets/column_spacer.dart';
import '../widgets/my_events_widget.dart';
import '../widgets/row_spacer.dart';
import 'event_info.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
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
final FirebaseFirestore _db = FirebaseFirestore.instance;
int current = 0;
String uid = '';

Future<List<Map<String, dynamic>>> getAllDocData(String collectionName, String name) async {
  List<Map<String, dynamic>> docDataList = [];
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection(collectionName).where('interest', arrayContainsAny: [name]).orderBy('interest').get();
  snapshot.docs.forEach((doc) {
    docDataList.add(doc.data() as Map<String, dynamic>);
  });
  
  print(name);
  uid = FirebaseAuth.instance.currentUser!.uid;
  // log(docDataList[0]['eventId']);
  return docDataList;
}

class _EventsState extends State<Events> {
  final TextEditingController _searchController = TextEditingController();
  bool isLoading = false;
  String uid = '';
  var userData = {};

  Future<List<Event>> getData() async {
    List<Event> events = [];

    final snapshot =
        await FirebaseFirestore.instance.collection('events').where('interest', arrayContainsAny: [sportList[current]]).orderBy('interest').get();

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
                            border: Border.all(
                                            color: Styles.greyAppColor, width: 1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              color: Styles.white),
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
                        Text('${data['price']} tg',style: TextStyle(color: Styles.orangeAppColor),),
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

  late Stream<QuerySnapshot> _dataStream;

  @override
  void initState() {
    getAllDocData("events", sportList[current]);
    super.initState();
    _dataStream = FirebaseFirestore.instance.collection('events').where('interest', arrayContainsAny: [sportList[current]]).orderBy('interest').snapshots();

    log(_dataStream.first.toString());
  }
  final List<String> sportList = <String>[
    "Football",
    "Volleyball",
    "Chess",
    "Basketball",
    "Tennis",
    "Baseball",
    "Bawling",
    "Golf",
    "Judo",
    "Badminton"
  ];
  String dropdownValue = cities.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.white,
      appBar: AppBar(
          elevation: 0,
          leading: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: SvgPicture.asset(AppSvgImages.vectorIconLogo,),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.arrow_downward),
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
                      child: Text(
                        value,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          backgroundColor: Styles.white),
      body: StreamBuilder<QuerySnapshot>(
          stream: _dataStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: textFieldInputText(
                        _searchController,
                        "Найти ближайшее мероприятия",
                        const Icon(Icons.search),
                        null,
                        TextInputType.text),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  /// CUSTOM TABBAR
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: sportList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                    // print(current);
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.all(5),
                                  width: 80,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: current == index
                                        ? Styles.orangeAppColor
                                        : Styles.bgColor,
                                    borderRadius: current == index
                                        ? BorderRadius.circular(15)
                                        : BorderRadius.circular(10),
                                    border: current == index
                                        ? Border.all(
                                            color: Styles.orangeAppColor, width: 2)
                                        : null,
                                  ),
                                  child: Center(
                                    child: Text(
                                      sportList[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: current == index
                                              ? Styles.white
                                              : Styles.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),

                  Expanded(
                    child: FutureBuilder<List<Event>>(
                      future: getData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasData) {
                          return EventCalendar(
                            calendarType: CalendarType.GREGORIAN,
                            calendarLanguage: 'en',
                            headerOptions: HeaderOptions(
                                weekDayStringType: WeekDayStringTypes.SHORT),
                            dayOptions: DayOptions(
                              selectedBackgroundColor: Styles.orangeAppColor,
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
                          return const Center(child: Text('No events found'));
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
