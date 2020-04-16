import 'package:flutter/material.dart';
import 'package:fluttertune/constants/app_constant.dart';
import 'package:fluttertune/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tune',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppConstant.PrimaryColor,
        accentColor: AppConstant.AccentColor,
        brightness: Brightness.light,
      ),
      home: SplashScreen(),
    );
  }
}
