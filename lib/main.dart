import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

/// 1. 创建全局EventBus对象
/// 2. 发送事件
/// 3. 监听事件类型
final eventBus = EventBus();

class UserInfo {
  String nickname;
  int level;

  UserInfo(this.nickname, this.level);
}

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EventBus"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(),
            MyText(),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("按钮"),
      onPressed: () {
        final userInfo = UserInfo("lqr", 1);
        eventBus.fire(userInfo);
      },
    );
  }
}

class MyText extends StatefulWidget {
  @override
  _MyTextState createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  String _message = "Hello Wrold";

  @override
  void initState() {
    super.initState();
    eventBus.on<UserInfo>().listen((data) {
      print(data.nickname);
      print(data.level);
      setState(() {
        _message = "${data.nickname} - ${data.level}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_message, style: TextStyle(fontSize: 20));
  }
}
