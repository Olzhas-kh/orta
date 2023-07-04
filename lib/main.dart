import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:orta/resources/app_styles.dart';
import 'package:orta/screens/splash_screen.dart';
// ignore: import_of_legacy_library_into_null_safe


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
        supportedLocales:const [
           Locale('en'),
           Locale('rr')
        ],
      localizationsDelegates: [
          GlobalMaterialLocalizations.delegate
        ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary:Styles.blueAppColor,
        ),
      ),
      home: const SplasshScreen()
      // SplashScreen(
      //   seconds: 3,
      //   navigateAfterSeconds: const OnBoarding1(),
      //   backgroundColor: Colors.white,
      //   useLoader: true,
      //   loaderColor: Colors.black,
      //   image: Image.asset(AppPngImages.splashLogo,alignment: Alignment.center,),
      //   photoSize: 100,
      //   title: const Text("More than a community", style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),),
      // ),
    );
  }
}

