import 'package:flutter/material.dart';
import 'package:orta/screens/splash_screens/end_onboarding.dart.dart';
import 'package:orta/utils/app_styles.dart';
import 'package:orta/widgets/circle_container.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
              
              children: [
                
                SizedBox(height: 50,),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: ()=> Navigator.of(context).pop(),
                      child:  Icon(Icons.arrow_back,color:Styles.greyColorButton,
                      
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                 Container(
                    width: double.infinity,
                    height: 290,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      vertical: 22,
                    ),
                    decoration: ShapeDecoration(
                      color: Styles.greyColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    child: Icon(Icons.photo, size: 50,)
                  ),
                SizedBox(height: 50,),
                Center(
                  child: DefaultTextStyle(
                      style: Styles.headLineStyle2.copyWith( fontWeight: FontWeight.bold,),
                      child: const Text(
                        "Heading about being a part of smtg big",
                      )),
                ),
                const SizedBox(height: 40,),
                Center(
                  child: DefaultTextStyle(
                      style: Styles.headLineStyle3.copyWith(),
                      child: const Text(
                        "Our communities is the best place to find soulmates. Just take a courage and step to a better life.",
                        textAlign: TextAlign.center,
                      )),
                ),
                const SizedBox(height: 80,),
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleContainer(color: Styles.greyColor,),
                      SizedBox(width: 15,),
                      CircleContainer(color: Styles.greyColor,),
                      SizedBox(width: 15,),
                      CircleContainer(color: Styles.greyColorButton),
          
                    ],
                  ),
                const SizedBox(height: 20,),
                InkWell(
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 22,
                      ),
                      decoration:  ShapeDecoration(
                        color: Styles.greyColorButton,
                        shape:  const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      child: Text(
                        "Next",
                        style: Styles.headLineStyle2.copyWith(color: Colors.white),
                      ),
                    ),
                    onTap: () {
                        Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const EndOnBoarding(),
                                                    ),
                                                  );
                    },
                  ),
                
              ],
            ),
          
        ),
        // Foreground widget here
      ),
    );
  }
}
