import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touchstone_assignment/dummyData.dart';
import 'package:touchstone_assignment/screens/homeScreen/components/sceneWidget.dart';
import 'package:touchstone_assignment/theme/colors.dart';

class RoomDetailWidget extends StatefulWidget {
  final Function onSliderChange;
  final Function onColorClick;
  final double sliderValue;
  final bool isActive;

  RoomDetailWidget(
      {this.onSliderChange,
      this.onColorClick,
      this.sliderValue,
      this.isActive});
  @override
  _RoomDetailWidgetState createState() => _RoomDetailWidgetState();
}

class _RoomDetailWidgetState extends State<RoomDetailWidget>
    with SingleTickerProviderStateMixin {
  bool state = false;
  List<String> sceneNames = ['Birthday', 'Party', 'Relax', 'Fun'];
  AnimationController _animationController;
  Animation _animation;

  _headerWidget(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Text(text,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )),
    );
  }

  _startAnimationFunction() {
    Future.delayed(Duration(seconds: 1), () {
      print('start ---------- ');
      setState(() {
        state = true;
      });
    });
  }

  @override
  void initState() {
    _startAnimationFunction();
    _animationController = AnimationController(
        duration: oneSecond, vsync: this, lowerBound: 0, upperBound: 1);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant RoomDetailWidget oldWidget) {
    print('updating detail');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _headerWidget('Intensity'),
            _buildSlider(),
            _headerWidget('Colors'),
            _colorsContainer(),
            _headerWidget('Scenes'),
            _buildSceneWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildSceneWidget() {
    List<Widget> childrens = [];
    sceneNames.asMap().forEach((key, value) => childrens.add(SceneWidget(
          linearGradient: gradientOfDetail[key],
          sceneName: sceneNames[key],
        )));
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      children: childrens,
      childAspectRatio: 8 / 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
    );
  }

  Widget _buildSlider() {
    return Row(
      children: [
        SvgPicture.asset('assets/images/solution1.svg'),
        Flexible(
          flex: 1,
          child: Slider(
            min: 0,
            divisions: 10,
            max: 1,
            value: widget.sliderValue,
            onChanged: widget.onSliderChange,
            label: 'hello',
            activeColor: yellowishColor,
            inactiveColor: yellowishColor,
          ),
        ),
        SvgPicture.asset('assets/images/solution.svg'),
      ],
    );
  }

  Widget _colorsContainer() {
    List<Widget> positionedItem() {
      List<Widget> items = [];
      for (int i = 0; i < colorsOfDetail.length; i++) {
        items.add(AnimatedPositioned(
          duration: shortDuration,
          curve: Curves.easeInOutSine,
          left: ((state ? 50 : 30) * i).toDouble(),
          child: InkWell(
            onTap: () => widget.onColorClick(i),
            child: Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: colorsOfDetail[i],
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ));
      }

      items.add(AnimatedPositioned(
        duration: shortDuration,
        curve: Curves.easeInOutSine,
        left: ((state ? 50 : 30) * colorsOfDetail.length + 1).toDouble(),
        child: Container(
          width: 40,
          height: 40,
          child: Icon(Icons.add),
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
        ),
      ));
      return items;
    }

    return Container(
      alignment: Alignment.centerLeft,
      height: 50,
      child: Stack(
        children: positionedItem(),
      ),
    );
  }
}
