import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orta/screens/auth_screens/login_page.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/widgets/circle_container.dart';

import '../../resources/app_svg_images.dart';
import '../../widgets/widgets_all.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: Center(
                        child: SvgPicture.asset(
                             AppSvgImages.iconOnBoarding))),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Heading about participating in eventsv",
                  style: Styles.headLineStyle2.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "In our app you can find thousands of events related to any interest. Make friends, find like-minded people, broad networking.",
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 40,
                ),
                buttonOnboarding(context, true, const LoginPage()),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleContainer(
                      color: Styles.greyColor,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    CircleContainer(
                      color: Styles.greyColor,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    CircleContainer(color: Styles.greyColorButton),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
