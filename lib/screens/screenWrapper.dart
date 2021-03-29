import 'package:flutter/material.dart';
import 'package:touchstone_assignment/screens/components/bottomNavBar.dart';
import 'package:touchstone_assignment/screens/homeScreen/homeScreen.dart';

class ScreenWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: HomeScreen(),
        bottomNavigationBar: BottomNavBarWidget(),
      ),
    );
  }
}
