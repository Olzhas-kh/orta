import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orta/resources/app_svg_images.dart';

import '../resources/app_styles.dart';

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

  List<IconData> icons = [
    Icons.home,
    Icons.explore,
    Icons.search,
    Icons.feed,
    Icons.post_add,
    Icons.local_activity,
    Icons.settings,
    Icons.person,
    Icons.person,
    Icons.person,
  ];
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
              child: TextField(
                onChanged: (value) {},
                controller: _searchController,
                decoration: const InputDecoration(
                    labelText: "Найти ближайшее мероприятия",
                    hintText: "Найти ближайшее мероприятия",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
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
                  }),
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
                    child: ListView.builder(
                      itemCount: 15,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Row(
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
                            children: const [
                              Text("31 март, 19:00 - 21:00"),
                              SizedBox(height: 10),
                              Text("Мастер класс по UX/UI design"),
                              SizedBox(height: 10),
                              Text("Мастер класс"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    dateTime: CalendarDateTime(
                      year: 2023,
                      month: 3,
                      day: 31,
                      calendarType: CalendarType.GREGORIAN,
                    ),
                  ),
                ],
              ),
            ),

            /// MAIN BODY
            // Container(
            //   margin: const EdgeInsets.only(top: 30),
            //   width: double.infinity,
            //   height: 550,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Icon(
            //         icons[current],
            //         size: 200,
            //         color: Colors.deepPurple,
            //       ),
            //       const SizedBox(
            //         height: 10,
            //       ),
            //       Text(
            //         sportList[current],
            //         style: TextStyle(
            //             fontWeight: FontWeight.w500,
            //             fontSize: 30,
            //             color: Colors.deepPurple),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),

      // ListView(
      //   children: [
      //     const SizedBox(height: 16,),
      // Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: TextField(
      //       onChanged: (value) {

      //       },
      //       controller: _searchController,
      //       decoration: const InputDecoration(
      //           labelText: "Найти ближайшее мероприятия",
      //           hintText: "Найти ближайшее мероприятия",
      //           prefixIcon: Icon(Icons.search),
      //           border: OutlineInputBorder(
      //               borderRadius: BorderRadius.all(Radius.circular(25.0)))),
      //     ),
      //   ),
      //   const SizedBox(height: 16,),
      //       SingleChildScrollView(
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         SizedBox(
      //           height: 55,
      //           child: ListView.builder(
      //             itemCount: 10,
      //             scrollDirection: Axis.horizontal,
      //             itemBuilder: (context, index) => Container(
      //               decoration: BoxDecoration(

      //                 borderRadius: BorderRadius.circular(26),
      //                 color: Color.fromARGB(255, 178, 174, 174)
      //               ),
      //               width: 150,
      //               margin: EdgeInsets.all(10),
      //               child: Center(
      //                 child: Text(
      //                   "${sportList[index]}",
      //                   style: TextStyle(color: Colors.white),
      //                 ),
      //               ),

      //             ),
      //           ),
      //         ),
      //         Flexible(
      //           child:
      // ListView.builder(
      //             itemCount: 15,
      //             physics: NeverScrollableScrollPhysics(),
      //             shrinkWrap: true,
      //             itemBuilder: (context, index) => Row(
      //               children: [
      //                 Container(
      //               decoration: BoxDecoration(

      //                 borderRadius: BorderRadius.circular(10),
      //                 color: Color.fromARGB(255, 178, 174, 174)
      //               ),
      //               width: 80,
      //               height: 80,
      //               margin: EdgeInsets.all(10),
      //               child: Center(
      //                 child: Text(
      //                   "Card $index",
      //                   style: TextStyle(color: Colors.white),
      //                 ),
      //               ),

      //             ),
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: const[
      //                     Text("Title"),
      //                     SizedBox(height: 10),
      //                     Text("Lorem Ipsum is simply dummy text  "),
      //                     SizedBox(height: 10),
      //                     Text("Lorem ipsum dolor sit"),
      //                   ],
      //                 ),

      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),

      //   ],
      // ),
    );
  }
}
