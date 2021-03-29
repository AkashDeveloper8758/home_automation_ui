import 'package:flutter/material.dart';

import '../../../dummyData.dart';
import 'home_grid_item.dart';

class RoomsWidget extends StatefulWidget {
  final Function onGridItemClick;

  RoomsWidget(this.onGridItemClick);

  @override
  _RoomsWidgetState createState() => _RoomsWidgetState();
}

class _RoomsWidgetState extends State<RoomsWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: oneSecond, vsync: this, lowerBound: 0, upperBound: 1);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _gridItems = listOfRooms
        .map((e) => GridViewItemWidget(e, widget.onGridItemClick))
        .toList();

    return FadeTransition(
      opacity: _animation,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Text(
              'All Rooms',
              style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          GridView.count(
            padding: EdgeInsets.all(8),
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            childAspectRatio: 1,
            children: _gridItems,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          )
        ],
      ),
    );
  }
}
