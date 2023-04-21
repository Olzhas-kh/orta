import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:orta/screens/organization_event_screens/organization_event_place.dart';
import 'package:orta/widgets/column_spacer.dart';
import 'package:orta/widgets/row_spacer.dart';
import 'package:orta/widgets/widgets_all.dart';

import '../../resources/app_styles.dart';
import '../../services/var_for_register.dart';

class OrganizationEventInterestPage extends StatefulWidget {
  const OrganizationEventInterestPage({super.key,});

  @override
  State<OrganizationEventInterestPage> createState() =>
      _OrganizationEventInterestPageState();
}

final TextEditingController _searchController = TextEditingController();
int tag = 1;
List<String> interests = [
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
List<String> tags = [];

class _OrganizationEventInterestPageState
    extends State<OrganizationEventInterestPage> {
  @override
  Widget build(BuildContext context) {
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
              indicatorTab(Styles.greyDark),
              const RowSpacer(1),
              indicatorTab(Styles.greyLight),
              const RowSpacer(1),
              indicatorTab(Styles.greyLight),
              const RowSpacer(1),
              indicatorTab(Styles.greyLight),
            ],
          ),
          const ColumnSpacer(2),
          organizationTitleText(
              context, "Іс-шараның қызығушылықтарын таңданыз"),
          const ColumnSpacer(1.5),
          const Text(
              "Іс-шараныз дұрыс адамдарға ұсынылу үшін кемінде 3 тақырыпты таңдаңыз"),
          const ColumnSpacer(2),
          textFieldInputText(_searchController, "Қызығушылықтарды іздеу",
              const Icon(Icons.search), null,TextInputType.text),
          const ColumnSpacer(1),
          ChipsChoice<String>.multiple(
            value: tags,
            onChanged: (value) {
              setState(() {
                tags = value;
              });
            },
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
            wrapped: true,
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
              nextButton(context, const OrganizationEventPlacePage(), valueToStatic() as Function)
            ]),
      ),
    );
  }
  List<String>? valueToStatic(){
    VarForAddEvents.interest = tags; 
    return VarForAddEvents.interest;
  }
}
