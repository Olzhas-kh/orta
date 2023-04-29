import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orta/resources/app_png_images.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/resources/app_svg_images.dart';
import 'package:orta/screens/splash_screens/onboarding1.dart';
import 'package:orta/widgets/column_spacer.dart';

class SplasshScreen extends StatefulWidget {
  const SplasshScreen({super.key});

  @override
  State<SplasshScreen> createState() => _SplasshScreenState();
}


class _SplasshScreenState extends State<SplasshScreen> {
  @override
  void initState() {
    _navigateToHome();
    super.initState();
  }
  _navigateToHome()async{
    await Future.delayed(const Duration(milliseconds: 1500), (){});
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const OnBoarding1()));
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Styles.blueAppColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppSvgImages.splashIcon),
            const ColumnSpacer(2),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 60),
              child: Text(
                "Ортаңды қалыптастыратын қосымша",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Styles.white),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Image.asset(AppPngImages.splashBack)
    );
  }
}
