import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarWidget extends StatefulWidget {
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  var _currentIndex = 0;

  List<Widget> _bottomNavItems = [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SvgPicture.asset(
        'assets/images/bulb.svg',
        height: 36,
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SvgPicture.asset(
        'assets/images/Icon feather-home.svg',
        height: 36,
      ),
    ),
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SvgPicture.asset(
        'assets/images/Icon feather-settings.svg',
        height: 36,
      ),
    )
  ];

  onTapFunction(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 12,
      child: Container(
        color: Colors.white,
        height: 58,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _bottomNavItems,
        ),
      ),
    );
    // return BottomNavigationBar(

    //   items: _bottomNavItems,
    //   currentIndex: _currentIndex,
    //   elevation: 12,
    //   onTap: onTapFunction,
    //   backgroundColor: Colors.white,
    // );
  }
}
