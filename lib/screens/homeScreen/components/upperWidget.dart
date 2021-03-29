import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:touchstone_assignment/models/room.dart';
import 'package:touchstone_assignment/theme/colors.dart';

import '../../../dummyData.dart';
import 'lightWidget.dart';

class UpperWidget extends StatelessWidget {
  final bool isClickActive;
  final Room currentRoom;
  final bool oneSecState;
  final Function onBackPress;
  final int colorIndex;
  final double sliderValue;
  const UpperWidget({
    Key key,
    @required this.isClickActive,
    @required this.currentRoom,
    @required this.oneSecState,
    @required this.onBackPress,
    @required this.colorIndex,
    @required this.sliderValue,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: oneSecond,
      // padding: EdgeInsets.only(top: 36),
      height: MediaQuery.of(context).size.height * (isClickActive ? .3 : .2),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: isClickActive
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.min,
              children: [
                if (isClickActive)
                  IconButton(
                      onPressed: onBackPress,
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      // margin: EdgeInsets.all(8),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * .5),
                      child: Text(
                        isClickActive ? currentRoom.roomName : 'Control Panel',
                        style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    AnimatedOpacity(
                      duration: shortDuration,
                      opacity: oneSecState ? 1 : 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          isClickActive
                              ? "${currentRoom.noOfLights} Lights"
                              : '',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: yellowishColor),
                        ),
                      ),
                    )
                  ],
                ),
                if (!isClickActive)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Expanded(child: SizedBox()),
                      SvgPicture.asset(
                        'assets/images/user.svg',
                      ),
                    ],
                  )
              ],
            ),
          ),
          AnimatedPositioned(
              duration: shortDuration,
              right: 8,
              top: oneSecState ? 0 : -20,
              child: AnimatedOpacity(
                duration: oneSecond,
                opacity: isClickActive ? 1 : 0,
                child: Stack(
                  overflow: Overflow.visible,
                  // alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      bottom: -15,
                      right: 0,
                      left: 0,
                      child: Center(
                        child: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(),
                          decoration: BoxDecoration(
                              color: colorsOfDetail[colorIndex]
                                  .withOpacity(sliderValue),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                    SvgPicture.asset('assets/images/Group 38.svg'),
                  ],
                ),
              )),
          if (isClickActive) lightsRow(context),
        ],
      ),
    );
  }

  Widget lightsRow(BuildContext context) {
    return AnimatedPositioned(
        curve: Curves.easeInOutSine,
        left: oneSecState ? 0 : MediaQuery.of(context).size.width,
        child: Container(
          margin: EdgeInsets.only(left: 8),
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: listOfLights.map((e) => LightWidget(light: e)).toList(),
          ),
        ),
        bottom: 0,
        duration: oneSecond);
  }
}
