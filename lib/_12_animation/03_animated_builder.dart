import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HeartBeatDemo(),
    );
  }
}

class HeartBeatDemo extends StatefulWidget {
  @override
  _HeartBeatDemoState createState() => _HeartBeatDemoState();
}

class _HeartBeatDemoState extends State<HeartBeatDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    // 1. 创建AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      // 与CurvedAnimation冲突, CurvedAnimation只支持 0.0 ~ 1.0
      // lowerBound: 50,
      // upperBound: 150,
    );

    // 2. 设置Curve值
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    // 3. 使用Tween, 设置值范围
    _animation = Tween(begin: 50.0, end: 150.0).animate(_animation);

    // // 监听动画值的改变
    // _controller.addListener(() {
    //   setState(() {});
    // });

    // 监听动画的状态改变
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 动画已完成
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // 动画未开始
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("心跳动画(AnimatedBuilder)")),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (ctx, child) {
            return Icon(
              Icons.favorite,
              color: Colors.red,
              size: _animation.value,
            );
          },
          // child: NotBuildWidget(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            if (_controller.status == AnimationStatus.reverse) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
