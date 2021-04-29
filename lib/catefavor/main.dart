import 'package:flutter/material.dart';
import 'package:flutterlearn/catefavor/core/router/router.dart';
import 'package:flutterlearn/catefavor/core/viewmodel/meal_view_model.dart';
import 'package:flutterlearn/catefavor/ui/shared/app_theme.dart';
import 'package:flutterlearn/catefavor/ui/shared/size_fit.dart';
import 'package:provider/provider.dart';

main() {
  runApp(
    ChangeNotifierProvider(
      create: (ctx) => MealViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize();
    return MaterialApp(
      title: '美食广场',
      theme: AppTheme.lightTheme,
      initialRoute: Routers.initialRoute,
      routes: Routers.routes,
      onGenerateRoute: Routers.generateRoute,
      onUnknownRoute: Routers.unknowRoute,
    );
  }
}
