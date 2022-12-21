import 'package:flutter/material.dart';
import 'package:grocerystoreapp/pages/HomePage.dart';
import 'package:grocerystoreapp/pages/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => SplashScreen(),
        "homePage": (context) => HomePage(),
      },
    );
  }
}
