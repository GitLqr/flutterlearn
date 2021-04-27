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
      appBar: AppBar(
        title: Text("手势监听"),
      ),
      body: ListenerDemo(),
    );
  }
}

class EventDeliveryDemo extends StatelessWidget {
  const EventDeliveryDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      /// 嵌套widget时会有问题, 点击子widget时, 子widget的onTapDown会回调, 但偶尔父widget的onTapDown会回调
      /// 解决方法: 不要嵌套, 可以使用stack
      child: GestureDetector(
        onTapDown: (details) {
          print("outer click");
        },
        child: Container(
          width: 200,
          height: 200,
          color: Colors.yellow,
          // alignment 会给child外层包裹一层Align, 从而解决child尺寸无效问题
          alignment: Alignment.center,
          child: GestureDetector(
            onTapDown: (details) {
              print("inner click");
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        ),
      ),
      // child: Stack(
      //   alignment: Alignment.center,
      //   children: [
      //     GestureDetector(
      //       onTapDown: (details) {
      //         print("outer click");
      //       },
      //       child: Container(width: 200, height: 200, color: Colors.yellow),
      //     ),
      //
      //     /// IgnorePointer: 可以让子Widget忽略指针事件
      //     IgnorePointer(
      //       child: GestureDetector(
      //         onTapDown: (details) {
      //           print("inner click");
      //         },
      //         child: Container(width: 100, height: 100, color: Colors.red),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}

class GestureDetectorDemo extends StatelessWidget {
  const GestureDetectorDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        print("手指按下");
        print(details.globalPosition); // 获取到相对于屏幕左上角的坐标
        print(details.localPosition); // 获取到相对于Widget左上角的坐标
      },
      onTapUp: (details) {
        print("手指抬起");
      },
      onTap: () {
        print("手势取消");
      },
      onTapCancel: () {
        print("手势点击");
      },
      onDoubleTap: () {
        print("手指双击");
      },
      onLongPress: () {
        print("长按手势");
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.orange,
      ),
    );
  }
}

class ListenerDemo extends StatelessWidget {
  const ListenerDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        print("指针按下:$event");
        print(event.position); // 获取到相对于屏幕左上角的坐标
        print(event.localPosition); // 获取到相对于Widget左上角的坐标
      },
      onPointerMove: (event) {
        print("指针移动:$event");
      },
      onPointerUp: (event) {
        print("指针抬起:$event");
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
    );
  }
}
