import 'package:flutter/material.dart';

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
      appBar: AppBar(title: Text("title")),
      body: HomeContent("hello world"),
    );
  }
}

/// 为什么Flutter在设计的时候StatefulWidget的build方法放在State中
/// 1. build出来的Widget是需要依赖State中的变量(状态/数据)
/// 2. 在Flutter的运行过程中：
///   Widget是不断的销毁和创建的
///   当我们自己的状态发生改变时，并不希望重新创建一个新的State
class HomeContent extends StatefulWidget {
  final String message;

  HomeContent(this.message);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getButtons(),
          Text("当前计数:$_counter", style: TextStyle(fontSize: 25)),
          Text("传递的信息:${widget.message}")
        ],
      ),
    );
  }

  Widget _getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text("+", style: TextStyle(fontSize: 20)),
          style: TextButton.styleFrom(backgroundColor: Colors.pink),
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
        ),
        ElevatedButton(
          child: Text("-", style: TextStyle(fontSize: 20)),
          style: TextButton.styleFrom(backgroundColor: Colors.purple),
          onPressed: () {
            setState(() {
              _counter--;
            });
          },
        ),
      ],
    );
  }
}
