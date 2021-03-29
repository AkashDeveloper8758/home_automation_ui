import 'package:flutter/cupertino.dart';
import 'package:touchstone_assignment/models/light.dart';
import 'package:touchstone_assignment/models/room.dart';
import 'package:touchstone_assignment/theme/colors.dart';

const oneSecond = Duration(seconds: 1);
const shortDuration = Duration(milliseconds: 500);

var listOfRooms = [
  Room('assets/images/bed.svg', 'Bed room', 4),
  Room("assets/images/room.svg", 'Living rooom', 2),
  Room('assets/images/kitchen.svg', 'Kitchen', 5),
  Room('assets/images/bathtube.svg', 'Bathroom', 1),
  Room('assets/images/house.svg', 'Outdoor', 5),
  Room('assets/images/balcony.svg', 'Balcony', 2),
];

var listOfLights = [
  Light('Main Light', 'assets/images/surface1.svg', false),
  Light('Desk lights', 'assets/images/solution2.svg', true),
  Light('Main Light', 'assets/images/bed (1).svg', false),
  Light('Desk lights', 'assets/images/solution2.svg', true),
  Light('Main Light', 'assets/images/bed (1).svg', false),
  Light('Desk lights', 'assets/images/solution2.svg', false),
];

const colorsOfDetail = [
  redOrangeColor,
  greenishColor,
  bluishColor,
  violetColor,
  pinkishColor,
  yellowishColor,
];

var gradientOfDetail = [
  LinearGradient(colors: [redOrangeColor, skinyColor]),
  LinearGradient(colors: [violetColor, pinkishColor]),
  LinearGradient(colors: [bluishColor, skyBluishColor]),
  LinearGradient(colors: [greenishColor, lightGreenColor]),
];
