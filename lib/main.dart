import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:orta/resources/app_png_images.dart';
import 'package:orta/screens/splash_screens/onboarding1.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: prefer_const_literals_to_create_immutables
      localizationsDelegates: [
         GlobalMaterialLocalizations.delegate
       ],
       supportedLocales:const [
          Locale('en'),
          Locale('kk'),
          Locale('rr')
       ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: const OnBoarding1(),
        backgroundColor: Colors.white,
        useLoader: true,
        loaderColor: Colors.black,
        image: Image.asset(AppPngImages.splashLogo,alignment: Alignment.center,),
        photoSize: 100,
        title: const Text("More than a community", style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),),
      ),
    );
  }
}

