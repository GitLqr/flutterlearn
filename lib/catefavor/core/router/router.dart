import 'package:flutter/material.dart';
import 'package:flutterlearn/catefavor/ui/pages/detail/detail.dart';
import 'package:flutterlearn/catefavor/ui/pages/main/main.dart';
import 'package:flutterlearn/catefavor/ui/pages/meal/meal.dart';

class Routers {
  static final String initialRoute = MainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    MainScreen.routeName: (ctx) => MainScreen(),
    MealScreen.routeName: (ctx) => MealScreen(),
    DetailScreen.routeName: (ctx) => DetailScreen(),
  };

  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknowRoute = (settings) {
    return null;
  };
}
