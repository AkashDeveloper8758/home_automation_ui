import 'package:flutter/material.dart';
import 'package:touchstone_assignment/screens/homeScreen/homeScreen.dart';
import 'package:touchstone_assignment/screens/screenWrapper.dart';
import 'package:touchstone_assignment/theme/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        primarySwatch: Colors.blue,
      ),
      home: ScreenWrapper(),
    );
  }
}
