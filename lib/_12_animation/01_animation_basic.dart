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

    // 监听动画值的改变
    _controller.addListener(() {
      setState(() {});
    });

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
      appBar: AppBar(title: Text("心跳动画")),
      body: Center(
        child: Icon(Icons.favorite, color: Colors.red, size: _animation.value),
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

// class HomePage extends StatelessWidget with SingleTickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     /**
//      * 1. Animation: 抽象类
//      *  监听动画值的改变
//      *  监听动画状态的改变
//      *  value
//      *  status
//      * 2. AnimationController: 继承自Animation
//      *  vsync: 同步信号(this -> SingleTickerProviderStateMixin)
//      *  forward(): 向前执行动画
//      *  reverse(): 向后执行动画
//      * 3. CurvedAnimation:
//      *  作用: 设置动画执行的速率(速度曲线)
//      * 4. Tween: 设置动画执行的value范围
//      *  begin: 开始值
//      *  end: 结束值
//      */
//
//     final controller = AnimationController(vsync: this);
//     final animation =
//         CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
//     final valueAnimation = Tween(begin: 100, end: 200).animate(animation);
//
//     return Scaffold(
//       appBar: AppBar(title: Text("动画")),
//       body: Center(
//         child: Text("Hello World"),
//       ),
//     );
//   }
// }
