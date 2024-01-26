import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'pages/BottomNavBar.dart';
import 'pages/splash/Splash_screen.dart';
import 'pages/stopwatch/stopwatch.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      title: 'ClockMaster',
      theme:  ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home:  SplashScreen(),
    );
  }
}
