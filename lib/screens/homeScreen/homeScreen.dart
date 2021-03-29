import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:touchstone_assignment/models/room.dart';

import 'components/lowerWidget.dart';
import 'components/upperWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Room currentRoom;
  bool _isClickActive = false;
  double _sliderValue = 1;
  int _colorIndex = 0;
  bool _oneSecState = false;

  onGridItemClick(Room room) {
    setState(() {
      currentRoom = room;
      _isClickActive = true;
    });
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _oneSecState = true;
      });
    });
  }

  onBackPress() {
    setState(() {
      _isClickActive = false;
      currentRoom = null;
      _oneSecState = false;
    });
  }

  onSliderChange(double sliderValue) {
    setState(() {
      _sliderValue = sliderValue;
    });
  }

  onColorPick(int value) {
    setState(() {
      _colorIndex = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UpperWidget(
            isClickActive: _isClickActive,
            currentRoom: currentRoom,
            oneSecState: _oneSecState,
            onBackPress: onBackPress,
            colorIndex: _colorIndex,
            sliderValue: _sliderValue,
          ),
          Expanded(child: SizedBox()),
          LowerWidget(
            isClickActive: _isClickActive,
            onGridItemClick: onGridItemClick,
            sliderValue: _sliderValue,
            onColorPick: onColorPick,
            onSliderChange: onSliderChange,
          )
        ],
      ),
    );
  }
}
