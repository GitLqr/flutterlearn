import 'package:flutter/material.dart';

class AppTheme {
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 24;

  static final Color lightTextColor = Colors.red;
  static final Color darkTextColor = Colors.green;

  static final ThemeData lightTheme = ThemeData(
    // 1. 亮度
    brightness: Brightness.light,
    // 2. primarySwatch传入不是Color，而是MaterialColor(包含了primaryColor和accentColor)
    primarySwatch: Colors.blue,
    // 3. primaryColor：单独设置导航和TabBar的颜色
    primaryColor: Colors.orange,
    // 4. accentColor：单独设置FloatingActionButton、Switch的颜色
    accentColor: Colors.green,
    // 5. Button主题
    buttonTheme: ButtonThemeData(
      height: 25,
      minWidth: 10,
      buttonColor: Colors.yellow,
    ),
    // 6. Card主题
    cardTheme: CardTheme(
      color: Colors.greenAccent,
      elevation: 10,
    ),
    // 7. Text主题
    textTheme: TextTheme(
      bodyText2: TextStyle(fontSize: normalFontSize, color: lightTextColor),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: TextTheme(
      bodyText2: TextStyle(fontSize: normalFontSize, color: darkTextColor),
    ),
  );
}
