import 'package:flutter/material.dart';
import 'package:flutterlearn/_14_screenfit/shared/size_fit.dart';
import 'package:flutterlearn/_14_screenfit/extension/double_extension.dart';
import 'package:flutterlearn/_14_screenfit/extension/int_extension.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize();

    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页")),
      body: Center(
        child: Container(
          width: 200.px,
          height: 200.px,
          color: Colors.red,
          alignment: Alignment.center,
          child: Text(
            "Hello World",
            style: TextStyle(fontSize: 20.px),
          ),
        ),
      ),
    );
  }
}
