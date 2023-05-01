import 'package:flutter/material.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/screens/event_info.dart';
import 'package:orta/widgets/column_spacer.dart';
import 'package:orta/widgets/my_events_widget.dart';

class MyEventsPage extends StatefulWidget {
  const MyEventsPage({super.key});

  @override
  State<MyEventsPage> createState() => _MyEventsPageState();
}
bool _isNow = true;
class _MyEventsPageState extends State<MyEventsPage> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const ColumnSpacer(2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isNow = false;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        color: _isNow ? Styles.greyLight : Styles.blueAppColor),
                    child: const Text("Келешек"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isNow = true;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        color: _isNow ? Styles.blueAppColor : Styles.greyLight),
                    child: const Text("Өткен"),
                  ),
                ),
              ],
            ),
            const ColumnSpacer(3),
            Expanded(
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, int index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const EventInfo()),
                              );
                            },
                            child: const MyEventsWidget());
                      },
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
