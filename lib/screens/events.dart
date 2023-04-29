import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orta/resources/app_svg_images.dart';
import 'package:orta/widgets/widgets_all.dart';
import 'package:intl/intl.dart';

import '../resources/app_styles.dart';
import '../utils/utils.dart';

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

class _EventsState extends State<Events> {
  final TextEditingController _searchController = TextEditingController();
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
  late Stream<QuerySnapshot> _dataStream;

  @override
  void initState() {
    super.initState();
    _dataStream = FirebaseFirestore.instance.collection('events').snapshots();
  }
 
  int current = 0;
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
                child: SvgPicture.asset(AppSvgImages.vectorIconLogo),
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

      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: textFieldInputText(_searchController, "Найти ближайшее мероприятия", const Icon(Icons.search),null,TextInputType.text),
            ),
            const SizedBox(
              height: 16,
            ),
            /// CUSTOM TABBAR
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: sportList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.all(5),
                            width: 80,
                            height: 45,
                            decoration: BoxDecoration(
                              color: current == index
                                  ? Styles.greyColor
                                  : Styles.bgColor,
                              borderRadius: current == index
                                  ? BorderRadius.circular(15)
                                  : BorderRadius.circular(10),
                              border: current == index
                                  ? Border.all(
                                      color: Styles.greyColor, width: 2)
                                  : null,
                            ),
                            child: Center(
                              child: Text(
                                sportList[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: current == index
                                        ? Colors.black
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                ),
            ),

            Expanded(
              child: EventCalendar(
                calendarType: CalendarType.GREGORIAN,
                calendarLanguage: 'en',
                headerOptions:
                    HeaderOptions(weekDayStringType: WeekDayStringTypes.SHORT),
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
                calendarOptions: CalendarOptions(viewType: ViewType.DAILY),
                events: [
                  Event(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _dataStream,
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        print(snapshot.hasData);
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) { 
                              DocumentSnapshot document = snapshot.data?.docs[index] as DocumentSnapshot<Object?>;
                              String eventFormattedDate = DateFormat('dd/MM/yyyy').format((document['eventDate'] as Timestamp).toDate());
                              // return ListTile(
                              //   title: Text(document['name']),
                              //   subtitle: Text(document['format']),
                              // );
                              return Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                    const Color.fromARGB(255, 178, 174, 174)),
                                  width: 80,
                                  height: 80,
                                  margin: const EdgeInsets.all(10),
                                  child: Center(
                                    child: Text(
                                      "Card $index",
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(eventFormattedDate),
                                    SizedBox(height: 10),
                                    Text(document['name']),
                                    SizedBox(height: 10),
                                    Text(document['format']),
                                  ],
                                )
                              ],
                            );
                            }
                        );
                      }
                      else if(snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      else {
                        return Text('Loading...');
                      }
                    }
                    ),   
                    dateTime: CalendarDateTime(
                      year: 2023,
                      month: 04,
                      day: 13,
                      calendarType: CalendarType.GREGORIAN,
                    ),
                  ),
                ],
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}
