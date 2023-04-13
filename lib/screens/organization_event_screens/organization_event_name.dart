import 'package:flutter/material.dart';
import 'package:orta/resources/app_styles.dart';

class OrganizationEventNamePage extends StatefulWidget {
  const OrganizationEventNamePage({super.key});

  @override
  State<OrganizationEventNamePage> createState() => _OrganizationEventNamePageState();
}

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
             Text("Выйти", style: Theme.of(context).textTheme.bodyLarge,)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            children: [
              Container(
                width: 57,
                height: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Styles.greyLight
                  
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}