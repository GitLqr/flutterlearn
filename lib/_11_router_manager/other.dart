import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  static const routeName = "/other";

  final _message;

  OtherPage(this._message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(title: Text("转场动画页面")),
      body: Center(
        child: Text(
          _message,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
