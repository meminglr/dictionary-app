import 'dart:math';

import 'package:flutter/material.dart';

class CardColors {
  final List<MaterialColor> materialColors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
  ];

  MaterialColor getRandomMaterialColor() {
    final random = Random();
    return materialColors[random.nextInt(materialColors.length)];
  }
}
