

import 'package:flutter/material.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/screens/organization_event_screens/organization_event_place.dart';
import 'package:orta/widgets/column_spacer.dart';
import 'package:orta/widgets/row_spacer.dart';
import 'package:orta/widgets/widgets_all.dart';

class OrganizationEventDescriptionPage extends StatefulWidget {
  const OrganizationEventDescriptionPage({super.key});

  @override
  State<OrganizationEventDescriptionPage> createState() => _OrganizationEventDescriptionPageState();
}

class _OrganizationEventDescriptionPageState extends State<OrganizationEventDescriptionPage> {
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
              indicatorTab(Styles.greyLight),
              const RowSpacer(1),
              indicatorTab(Styles.greyLight),
              const RowSpacer(1),
              indicatorTab(Styles.greyLight),
              const RowSpacer(1),
              indicatorTab(Styles.greyDark),
            ],
          ),
          const ColumnSpacer(2),
          organizationTitleText(
              context, "Қосымша ақпарат"),
          const ColumnSpacer(1.5),
          const Text(
              "Іс-шаранызды сипаттайтын сипаттама жазыңыз"),
          const ColumnSpacer(2),
          
          
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              backButton(context),
              nextButton(context, const OrganizationEventPlacePage())
            ]),
      ),
    );;
  }
}