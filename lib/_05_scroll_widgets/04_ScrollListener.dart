import 'dart:math';

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _controller = ScrollController(
    initialScrollOffset: 100, // 初始化偏移量
  );

  bool _isShowFloatingBtn = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print("监听到滚动...: ${_controller.offset}");
      if (_controller.offset > 1000) {
        setState(() {
          _isShowFloatingBtn = true;
        });
      } else {
        setState(() {
          _isShowFloatingBtn = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("列表测试")),

      /// 两种方式可以监听:
      ///   controller:
      ///     1. 可以设置默认值offset
      ///     2. 监听滚动, 也可以监听滚动的位置
      ///   NotificationListener: 本质是Widget
      ///     1. 开始滚动和结束滚动
      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollStartNotification) {
            print("开始滚动");
          } else if (notification is ScrollUpdateNotification) {
            print(
                "正在滚动... 总滚动距离: ${notification.metrics.maxScrollExtent} , 当前滚动的位置: ${notification.metrics.pixels}");
          } else if (notification is ScrollEndNotification) {
            print("结束滚动");
          }

          /// true: 停止通知冒泡
          return true;
        },
        child: ListView.builder(
          controller: _controller,
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.people),
              trailing: Icon(Icons.delete),
              title: Text("联系人$index"),
            );
          },
        ),
      ),
      floatingActionButton: _isShowFloatingBtn
          ? FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          // scrollController.jumpTo(0);
          _controller.animateTo(0,
              duration: Duration(seconds: 1), curve: Curves.easeIn);
        },
      )
          : null,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
