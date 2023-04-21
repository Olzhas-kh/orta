

import 'package:flutter/material.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/screens/organization_event_screens/organization_event_time.dart';
import 'package:orta/services/var_for_register.dart';
import 'package:orta/widgets/column_spacer.dart';
import 'package:orta/widgets/row_spacer.dart';
import 'package:orta/widgets/widgets_all.dart';

class OrganizationEventPlacePage extends StatefulWidget {
  const OrganizationEventPlacePage({super.key,});

  @override
  State<OrganizationEventPlacePage> createState() => _OrganizationEventPlacePageState();
}
final TextEditingController _placeController = TextEditingController();

class _OrganizationEventPlacePageState extends State<OrganizationEventPlacePage> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              indicatorTab(Styles.greyLight),
              const RowSpacer(1),
              indicatorTab(Styles.greyLight),
              const RowSpacer(1),
              indicatorTab(Styles.greyDark),
              const RowSpacer(1),
              indicatorTab(Styles.greyLight),
              const RowSpacer(1),
              indicatorTab(Styles.greyLight),
            ],
          ),
          const ColumnSpacer(2),
          organizationTitleText(context, "Өтетін орнын таңданыз"),
          const ColumnSpacer(1.5),
          
          textFieldInputText(_placeController, "Өтетін орны", null, const Icon(Icons.location_on_outlined),TextInputType.text),
                    



        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          backButton(context),
          GestureDetector(
            onTap: () {
            VarForAddEvents.location = _placeController.text; 
            Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OrganizationEventTimePage()));
            },
            child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: Styles.greyDark,
            ),
            child: const Text("Келесі"),
      )
    ),
        ]),
      ),
    );
}
}