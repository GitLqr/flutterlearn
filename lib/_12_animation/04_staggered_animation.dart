import 'dart:math';

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
  Animation _sizeAnim;
  Animation _colorAnim;
  Animation _opacityAnim;
  Animation _radiansAnim;

  @override
  void initState() {
    super.initState();
    // 1. 创建AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      // 与CurvedAnimation冲突, CurvedAnimation只支持 0.0 ~ 1.0
      // lowerBound: 50,
      // upperBound: 150,
    );

    // 2. 设置Curve值
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    // 3. 使用Tween, 设置值范围
    // 3.1 创建size的tween
    _sizeAnim = Tween(begin: 10.0, end: 200.0).animate(_controller);
    // 3.2 创建color的tween
    _colorAnim = ColorTween(begin: Colors.orange, end: Colors.purple)
        .animate(_controller);
    // 3.3 创建opacity的tween
    _opacityAnim = Tween(begin: 0.0, end: 1.0).animate(_controller);
    // 3.4 创建radians的tween
    _radiansAnim = Tween(begin: 0.0, end: 2 * pi).animate(_controller);

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
    /// 1. 大小变化动画
    /// 2. 颜色变化动画
    /// 3. 透明度变化动画
    return Scaffold(
      appBar: AppBar(title: Text("交织动画")),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (ctx, child) {
            return Opacity(
              opacity: _opacityAnim.value, // 半透明
              child: Transform(
                // 以中心点为原心, 在z轴上旋转45度
                transform: Matrix4.rotationZ(_radiansAnim.value),
                alignment: Alignment.center,
                child: Container(
                  width: _sizeAnim.value,
                  height: _sizeAnim.value,
                  color: _colorAnim.value,
                ),
              ),
            );
          },
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
