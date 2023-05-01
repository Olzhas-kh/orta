import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orta/resources/app_png_images.dart';
import 'package:orta/resources/app_svg_images.dart';
import 'package:orta/screens/splash_screens/onboarding2.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/widgets/circle_container.dart';
import 'package:orta/widgets/column_spacer.dart';
import 'package:orta/widgets/row_spacer.dart';
import 'package:orta/widgets/widgets_all.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

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
                      lineContainerOnBoarding(Styles.white),
                      const RowSpacer(1),
                      lineContainerOnBoarding(Styles.greyAppColor),
                      const RowSpacer(1),
                      lineContainerOnBoarding(Styles.greyAppColor)
                    ],
                  ),
                  const ColumnSpacer(3),
                  Text(
                    "Создавай события и приглашай друзей",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Styles.white, fontWeight: FontWeight.bold),
                  ),
                  const ColumnSpacer(3),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Планируешь крупную вечереинку или встречу только для своих? Создай классное мероприятие, которое понравится всем",
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
              buttonOnboarding(context, true, const OnBoarding2()),
              const ColumnSpacer(3),
              textButtonOnboarding(
                context,
              )
            ],
          ),
        ));
  }
}
