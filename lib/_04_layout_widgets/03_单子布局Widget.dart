import 'package:flutter/material.dart';
import 'dart:math';

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // width、height不指定，默认是包裹内容
          width: 200,
          height: 200,
          child: Icon(Icons.pets, size: 50, color: Colors.white),
          // 子元素所在位置
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10),
          // 旋转5度，缩小一半
          transform: Matrix4.rotationZ(degree2Radia(5)).scaled(0.5),
          color: Colors.red,
        ),
        Container(
          width: 200,
          height: 200,
          child: Icon(Icons.accessibility, size: 50, color: Colors.white),
          // color与decoration冲突，两者只有选择其中一个
          // color: Colors.red,
          decoration: BoxDecoration(
              color: Colors.red, // 背景色
              border: Border.all(width: 5, color: Colors.blueAccent), // 边框
              borderRadius: BorderRadius.circular(8), // 圆角
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey, // 阴影颜色
                  offset: Offset(10, 10), // 阴影偏移量
                  spreadRadius: 5, // 延伸，相当于offset为 15,15
                ),
              ]),
        )
      ],
    );
  }

  double degree2Radia(double degree) {
    return degree * pi / 180;
  }
}

class PaddingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: item("hello lqr"),
        ),
        Divider(height: 1, color: Colors.black),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: item("hello gitlqr"),
        ),
        Divider(height: 1, color: Colors.black),
        Padding(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: item("hello charylin"),
        ),
        Divider(height: 1, color: Colors.black),
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: item("hello charylin"),
        ),
        Divider(height: 1, color: Colors.black),
      ],
    );
  }

  Widget item(String content) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 30,
        backgroundColor: Colors.red,
        color: Colors.white,
      ),
    );
  }
}

class AlignDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Center其实就是指定了alignment为center的Align
    // return Center(
    //   child: Icon(Icons.pets),
    // );
    return Align(
      widthFactor: 5, // 宽度是child宽度的5倍
      heightFactor: 5, // 高度是child高度的5倍
      alignment: Alignment.center,
      child: Icon(Icons.pets),
    );
  }
}
