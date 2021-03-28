import 'package:flutter/material.dart';
import 'package:flutter_praktikum2_modul1/Screens/Splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito'
      ),
      home: SplashScreen(),
    );
  }
}