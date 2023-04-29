import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/widgets/column_spacer.dart';
import 'package:orta/widgets/row_spacer.dart';

class EventInfo extends StatefulWidget {
  const EventInfo({super.key});

  @override
  State<EventInfo> createState() => _EventInfoState();
}

int tag = 1;
List<String> interests = [
  "Football",
  "Volleyball",
  "Chess",
];
List<String> tags = [];

class _EventInfoState extends State<EventInfo> {
  @override
  Widget build(BuildContext context) {
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
                    const Text("Мастер класс"),
                    const ColumnSpacer(0.8),
                    Text(
                      "UX/UI design",
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
                          const Text("Жәнібек Джексон"),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          const ColumnSpacer(2),
                          Row(
                            children: const [
                              Text("12"),
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
                  const Text(
                      "Lorem ipsum dolor sit amet consectetur. Dis ullamcorper cras vel donec leo aenean et. Показать больше"),
                  const ColumnSpacer(0.5),
                  Divider(),
                  const ColumnSpacer(0.5),
                  Row(
                    children: const [
                      Icon(
                        Icons.calendar_month,
                        size: 20,
                      ),
                      RowSpacer(0.5),
                      Text("11 март ")
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
                    children: const [
                      Icon(
                        Icons.location_on,
                        size: 20,
                      ),
                      RowSpacer(0.5),
                      Text("SDU. ​Проспект Абылай хана, 1/1 "),
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
                child: Text("Тегін", style: Theme.of(context).textTheme.headlineSmall,),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                decoration: BoxDecoration(

                    borderRadius: const BorderRadius.all(Radius.circular(16),
                    
                    ),
                    color: Styles.greyColor
                    ),
                    child: Text("Қатысу"),
              )
            ],
          )),
    );
  }
}
