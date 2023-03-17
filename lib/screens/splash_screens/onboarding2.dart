import 'package:flutter/material.dart';
import 'package:orta/screens/splash_screens/onboarding2.dart';
import 'package:orta/screens/splash_screens/onboarding3.dart';
import 'package:orta/utils/app_styles.dart';
import 'package:orta/widgets/circle_container.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const SizedBox(height: 100,),
         SizedBox(
            height: 400,
            width: double.infinity,
            child: Center(child: Image.asset("assets/images/icon.png"))),
            
            const SizedBox(height: 50,),
            Text("Heading about participating in eventsv",style: Styles.headLineStyle2.copyWith(fontSize: 20, fontWeight: FontWeight.bold,),),
            const SizedBox(height: 20,),
            const Text("In our app you can find thousands of events related to any interest. Make friends, find like-minded people, broad networking.",style: TextStyle(fontSize: 14),),
            const SizedBox(height: 40,),
                
              
                  InkWell(
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          vertical: 18,
                        ),
                        decoration:  ShapeDecoration(
                          color: Styles.greyColorButton,
                          shape:  const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        child: Text(
                          "Батырма",
                          style: Styles.headLineStyle2.copyWith(color: Colors.white),
                        ),
                      ),
                      onTap: () {
                          Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const OnBoarding3(),
                                                      ),
                                                    );
                      },
                    ),
                    const SizedBox(height: 30,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleContainer(color: Styles.greyColor,),
                      const SizedBox(width: 15,),
                      CircleContainer(color: Styles.greyColorButton,),
                      const SizedBox(width: 15,),
                      CircleContainer(color: Styles.greyColor),
          
                    ],
                  ),
          ]
        ),
      ),
    );
  }
}
