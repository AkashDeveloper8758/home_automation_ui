import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touchstone_assignment/models/room.dart';
import 'package:touchstone_assignment/theme/colors.dart';

class GridViewItemWidget extends StatelessWidget {
  final Room room;
  final Function onClick;

  const GridViewItemWidget(this.room, this.onClick);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(room),
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              room.svgImage,
              height: 56,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                room.roomName,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '${room.noOfLights} Lights',
              style: TextStyle(
                  fontSize: 18,
                  color: yellowishColor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
