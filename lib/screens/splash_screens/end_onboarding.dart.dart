import 'package:flutter/material.dart';
import 'package:orta/resources/app_png_images.dart';
import 'package:orta/screens/auth_screens/login_page.dart';
import 'package:orta/screens/auth_screens/registration_page.dart';

import '../../resources/app_styles.dart';

class EndOnBoarding extends StatelessWidget {
  const EndOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 150,
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                               
                                image: AssetImage(AppPngImages.logo)
                              )
                            ),
                          ),
                          Container(
                        width: 100,
                        height: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppPngImages.ortaApp)
                          )
                        ),
                      ),
                      const Text("More than a community", style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
               
              
              
              const SizedBox(
                height: 180,
              ),

              InkWell(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 22,
                  ),
                  decoration:  ShapeDecoration(
                    color: Styles.greyColorButton,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  child: Text(
                    "Register",
                    style: Styles.headLineStyle2.copyWith(color: Colors.white),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const RegistrationPage(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              
              InkWell(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 22,
                  ),
                  decoration:  ShapeDecoration(
                    color: Styles.greyColorButton,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: Styles.headLineStyle2.copyWith(color: Colors.white),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              
            ],
          ),
        ),
      ]),
    );
  }
}
