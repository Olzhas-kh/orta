import 'package:flutter/material.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/screens/organization_event_screens/organization_event_interest.dart';
import 'package:orta/services/var_for_register.dart';
import 'package:orta/widgets/column_spacer.dart';
import 'package:orta/widgets/row_spacer.dart';
import 'package:orta/widgets/widgets_all.dart';

class OrganizationEventNamePage extends StatefulWidget {
  const OrganizationEventNamePage({super.key});

  @override
  State<OrganizationEventNamePage> createState() =>
      _OrganizationEventNamePageState();
}
final TextEditingController _nameController = TextEditingController();

class _OrganizationEventNamePageState extends State<OrganizationEventNamePage> {
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
              indicatorTab(Styles.greyDark),
              const RowSpacer(1),
              indicatorTab(Styles.greyLight),
              const RowSpacer(1),
              indicatorTab(Styles.greyLight),
              const RowSpacer(1),
              indicatorTab(Styles.greyLight),
              const RowSpacer(1),
              indicatorTab(Styles.greyLight),
            ],
          ),
          const ColumnSpacer(2),
          organizationTitleText(context, "Іс-шараның атауын қойыңыз"),
          const ColumnSpacer(1.5),
          const Text("Адамдарға топтың не туралы екенін анық түсінуге мүмкіндік беретін атауды таңдаңыз"),
                    const ColumnSpacer(2),
          textFieldInputText(_nameController, "Іс-шара атауы", null, null,TextInputType.text),
                    const ColumnSpacer(1),
                     Text("Кемінде 5 символ еңгізіңіз",style: Theme.of(context).textTheme.bodySmall,)



        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          backButton(context),
          nextButton(context, const OrganizationEventInterestPage(), valueToStatic() as Function)
        ]),
      ),
    );
  }
  String? valueToStatic(){
    VarForAddEvents.name = _nameController.text; 
    return VarForAddEvents.name;
  }
}
