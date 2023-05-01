import 'package:flutter/material.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/screens/organization_event_screens/organization_event_name.dart';
import 'package:orta/widgets/column_spacer.dart';

class OrganizationMain extends StatelessWidget {
  const OrganizationMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.white,
      appBar: AppBar(
        title: Text(
          "Іс-шара ұйымдастыру",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Styles.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Styles.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("0 event"),
            const ColumnSpacer(15),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "Өз іс-шаранызды ұйымдастрыныз",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const ColumnSpacer(2),
                  Container(
                    height: 190,
                    width: 255,
                    color: Styles.greyColor,
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Styles.blueAppColor,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const OrganizationEventNamePage(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
