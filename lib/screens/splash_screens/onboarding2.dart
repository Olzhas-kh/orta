import 'package:flutter/material.dart';
import 'package:orta/resources/app_png_images.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/screens/splash_screens/onboarding3.dart';
import 'package:orta/widgets/column_spacer.dart';
import 'package:orta/widgets/row_spacer.dart';
import 'package:orta/widgets/widgets_all.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppPngImages.onBoarding))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      lineContainerOnBoarding(Styles.greyAppColor),
                      const RowSpacer(1),
                      lineContainerOnBoarding(Styles.white),
                      const RowSpacer(1),
                      lineContainerOnBoarding(Styles.greyAppColor)
                    ],
                  ),
                  const ColumnSpacer(3),
                  Text(
                    "Общайся и находи для себя компания",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Styles.white, fontWeight: FontWeight.bold),
                  ),
                  const ColumnSpacer(3),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Orta - это место, где можно не только найти интересное мероприятие, но и завести новые знакомства",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Styles.white,
                          ),
                    ),
                  ),
                ],
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              buttonOnboarding(context, true, const OnBoarding3()),
              const ColumnSpacer(3),
              textButtonOnboarding(
                context,
              )
            ],
          ),
        ));
  }
}
