import 'package:flutter/material.dart';
import 'package:orta/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:orta/screens/splash_screens/onboarding1.dart';
import 'package:splashscreen/splashscreen.dart';
// import 'database_management/shared_preferences_services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // await sharedPrefs.sharePrefsInit();
  // sharedPrefs.setItems(setCategoriesToDefault: false);
  // sharedPrefs.getCurrency();
  // sharedPrefs.getAllExpenseItemsLists();
 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        image: Image.asset("assets/images/logo1.png"),
        
        photoSize: 100,
        title: Text("More than a community", style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),),
      ),
    );
  }
}

