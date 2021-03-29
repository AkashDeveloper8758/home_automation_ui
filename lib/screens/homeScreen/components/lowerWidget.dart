import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touchstone_assignment/screens/homeScreen/components/roomsWidget.dart';
import 'package:touchstone_assignment/theme/colors.dart';

import '../../../dummyData.dart';
import '../../detailWidget.dart';
import 'home_grid_item.dart';

class LowerWidget extends StatelessWidget {
  const LowerWidget({
    Key key,
    @required this.isClickActive,
    @required this.sliderValue,
    @required this.onGridItemClick,
    @required this.onColorPick,
    @required this.onSliderChange,
  });

  final bool isClickActive;
  final double sliderValue;
  final Function onGridItemClick;
  final Function onColorPick;
  final Function onSliderChange;

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOutSine,
          height:
              MediaQuery.of(context).size.height * (isClickActive ? .58 : .68),
          padding: EdgeInsets.all(16),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            color: surfaceColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32)),
          ),
          child: SingleChildScrollView(
            child: isClickActive
                ? RoomDetailWidget(
                    onColorClick: onColorPick,
                    onSliderChange: onSliderChange,
                    sliderValue: sliderValue,
                    isActive: isClickActive,
                  )
                : RoomsWidget(onGridItemClick),
          ),
        ),
        if (isClickActive)
          Positioned(
            right: 30,
            top: -10,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey)]),
              child: SvgPicture.asset(
                'assets/images/Icon awesome-power-off.svg',
                height: 24,
                width: 24,
              ),
            ),
          )
      ],
    );
  }
}
