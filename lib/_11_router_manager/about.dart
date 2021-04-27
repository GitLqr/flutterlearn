import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const routeName = "/about";

  @override
  Widget build(BuildContext context) {
    final String message = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text("关于页")),
      body: Center(
        child: Column(
          children: [
            Text(message),
            ElevatedButton(
              child: Text("回到首页"),
              onPressed: () => _backToHome(context),
            ),
          ],
        ),
      ),
    );
  }

  void _backToHome(BuildContext context) {
    Navigator.of(context).pop("a about message");
  }
}
