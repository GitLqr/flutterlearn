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
      appBar: AppBar(title: Text("心跳动画(AnimatedWidget)")),
      body: Center(
        // child: Icon(Icons.favorite, color: Colors.red, size: _animation.value),
        child: HeartBeatWidget(_animation),
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

/// 这里一段有问题的代码:
/// _controller.addListener(() {
///    setState(() {});
/// });
/// 1. 每次写动画, 都需要写这一段代码
/// 2. setState -> Build
///
/// 优化方案:
/// AnimationWidget
///   - 将需要执行动画的Widget放到一个AnimatedWidget中的build方法里进行返回
///   - 缺点:
///     1. 每次都需要创建一个类
///     2. 如果构建的Widget有子类, 那么子类依然会重复build
///
class HeartBeatWidget extends AnimatedWidget {
  HeartBeatWidget(Animation anim) : super(listenable: anim);

  @override
  Widget build(BuildContext context) {
    Animation anim = listenable;
    return Icon(Icons.favorite, color: Colors.red, size: anim.value);
  }
}
