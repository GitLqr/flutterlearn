import 'package:flutter/material.dart';

main() => runApp(MyApp());

/// Widget:
/// 有状态的Widget: StatefulWidget 在运行过程中有一些状态(data)需要改变
/// 无状态的Widget: StatelessWidget 内容是确定没有状态(data)的改变
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个Flutter程序"),
      ),
      body: ContentBody(),
    );
  }
}

/// flag：状态
/// Stateful不能定义状态 -> 创建一个单独的类，这个类负责维护状态
class ContentBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContentBodyState();
  }
}

/// 使用State类来保存状态
class ContentBodyState extends State<ContentBody> {
  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            value: flag,
            onChanged: (value) {
              /// flag = value; // 无效代码，不会刷新界面
              /// 必须使用 setState() 方法强制界面刷新
              setState(() {
                flag = value;
              });
            },
          ),
          Text("同意协议", style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
