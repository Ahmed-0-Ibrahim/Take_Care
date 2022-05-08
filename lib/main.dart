import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workout_app/style/styling.dart';
import 'package:workout_app/translation.dart';
import 'views/welcome.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      title: 'Take Care',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Aeonik',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColor.tColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Welcome(),
      translations: Translation(),
      locale: Locale('en'),
      fallbackLocale: Locale('en'),
    );
  }
}
