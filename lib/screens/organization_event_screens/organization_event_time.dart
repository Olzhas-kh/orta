import 'package:flutter/material.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/screens/organization_event_screens/organization_event_interest.dart';
import 'package:orta/widgets/column_spacer.dart';
import 'package:orta/widgets/row_spacer.dart';
import 'package:orta/widgets/widgets_all.dart';

class OrganizationEventTimePage extends StatefulWidget {
  const OrganizationEventTimePage({super.key});

  @override
  State<OrganizationEventTimePage> createState() =>
      _OrganizationEventTimePageState();
}

class _OrganizationEventTimePageState extends State<OrganizationEventTimePage> {
  DateTime dateTime = DateTime.now();
  DateTime endDateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    final endHours = endDateTime.hour.toString().padLeft(2, '0');
    final endMinutes = endDateTime.minute.toString().padLeft(2, '0');
    return Scaffold(
      backgroundColor: Styles.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Styles.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Выйти",
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              indicatorTab(Styles.greyLight),
              const RowSpacer(1),
              indicatorTab(Styles.greyLight),
              const RowSpacer(1),
              indicatorTab(Styles.greyLight),
              const RowSpacer(1),
              indicatorTab(Styles.greyDark),
              const RowSpacer(1),
              indicatorTab(Styles.greyLight),
            ],
          ),
          const ColumnSpacer(2),
          organizationTitleText(
              context, "Іс-шараның уақыты мен ұзақтығын көрсетіңіз"),
          const ColumnSpacer(1.5),
          const Text("Дата"),
          const ColumnSpacer(0.5),
          GestureDetector(
            onTap: () async {
              final date = await pickDate();
              if (date == null) return;

              final newDate = DateTime(dateTime.year, dateTime.month,
                  dateTime.day, dateTime.hour, dateTime.minute);

              setState(() {
                dateTime = newDate;
              });
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  border: Border.all(width: 1, color: Styles.greyLight)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${dateTime.day}/${dateTime.month}/${dateTime.year}"),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
          ),
          const ColumnSpacer(1.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Уақыты"),
                  const ColumnSpacer(0.5),
                  GestureDetector(
                    onTap: () async{
                      final time = await pickTime();
                      if(time==null)return;
                      final newDate = DateTime(dateTime.year,dateTime.month,dateTime.day,time.hour,time.minute);
                      setState(() {
                        dateTime = newDate;
                      });
                      
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          border:
                              Border.all(width: 1, color: Styles.greyLight)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("$hours:$minutes"),
                            const RowSpacer(3),
                            const Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Ұзақтығы"),
                  const ColumnSpacer(0.5),
                  GestureDetector(
                    onTap: () async{
                      final time = await pickEndTime();
                      if(time==null)return;
                      final newDate = DateTime(endDateTime.year,endDateTime.month,endDateTime.day,time.hour,time.minute);
                      setState(() {
                        endDateTime = newDate;
                      });
                      
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          border:
                              Border.all(width: 1, color: Styles.greyLight)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("$endHours:$endMinutes"),
                            const RowSpacer(3),
                            const Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              backButton(context),
              nextButton(context, const OrganizationEventInterestPage())
            ]),
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      locale: const Locale("ru","RU"),
      );
      
  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
     
      );
  Future<TimeOfDay?> pickEndTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: endDateTime.hour, minute: endDateTime.minute),
     
      );
}
