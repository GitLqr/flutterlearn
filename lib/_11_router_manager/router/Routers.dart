import 'package:flutter/material.dart';
import 'package:flutterlearn/_11_router_manager/other.dart';
import '../about.dart';
import '../main.dart';
import '../detail.dart';
import '../unknow.dart';

class Routers {
  static final Map<String, WidgetBuilder> routes = {
    HomePage.routeName: (ctx) => HomePage(),
    AboutPage.routeName: (ctx) => AboutPage(),
  };

  static final String initialRoute = HomePage.routeName;

  static final RouteFactory generateRoute = (settings) {
    if (settings.name == DetailPage.routeName) {
      return MaterialPageRoute(
        builder: (ctx) => DetailPage(settings.arguments),
      );
    }
    if (settings.name == OtherPage.routeName) {
      return PageRouteBuilder(
        transitionDuration: Duration(seconds: 1),
        pageBuilder: (ctx, animation, animation2) {
          return FadeTransition(
            opacity: animation,
            child: OtherPage("Hello GitLqr"),
          );
        },
      );
    }
    return null;
  };

  static final RouteFactory unknowRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) {
      return UnknowPage();
    });
  };
}
