import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touchstone_assignment/models/light.dart';
import 'package:touchstone_assignment/theme/colors.dart';

class LightWidget extends StatelessWidget {
  final Light light;

  const LightWidget({Key key, this.light}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      // width: 100,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: light.isClick ? primaryDarkColor : Colors.white,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            light.iconAsset,
            color:
                light.isClick ? Colors.white : Theme.of(context).primaryColor,
          ),
          SizedBox(width: 8),
          Text(
            light.name,
            style: TextStyle(
              fontSize: 18,
              color:
                  light.isClick ? Colors.white : Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
