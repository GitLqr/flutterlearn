import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  // 1. 共有属性
  static const double bodyFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 24;

  // 2. 普通模式
  static final Color lightColors = Colors.red;
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.pink,
    canvasColor: Color.fromRGBO(255, 254, 222, 1), // 背景色
    textTheme: TextTheme(
      body1: TextStyle(fontSize: bodyFontSize),
      display1: TextStyle(fontSize: smallFontSize, color: Colors.black87),
      display2: TextStyle(fontSize: normalFontSize, color: Colors.black87),
      display3: TextStyle(fontSize: largeFontSize, color: Colors.black87),
    ),
  );

  // 3. 暗黑模式
  static final Color darkColors = Colors.green;
  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: TextTheme(
      body1: TextStyle(fontSize: normalFontSize, color: darkColors),
    ),
  );
}
