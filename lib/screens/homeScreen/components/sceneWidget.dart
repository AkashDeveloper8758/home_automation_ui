import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SceneWidget extends StatelessWidget {
  final LinearGradient linearGradient;
  final String sceneName;

  const SceneWidget({Key key, this.linearGradient, this.sceneName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(8),
      width: 100,
      decoration: BoxDecoration(
          gradient: linearGradient, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: SvgPicture.asset(
              'assets/images/solution2.svg',
              color: Colors.white,
              height: 30,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            sceneName,
            style: TextStyle(color: Colors.white, fontSize: 18),
          )
        ],
      ),
    );
  }
}
