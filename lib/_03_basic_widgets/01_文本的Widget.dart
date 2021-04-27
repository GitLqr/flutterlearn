import 'package:flutter/material.dart';

/// Text.rich()的使用Demo
class TextRichDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        // text: "Hello World",
        // style: TextStyle(color: Colors.red,fontSize: 20)
        children: [
          TextSpan(text: "Hello World", style: TextStyle(color: Colors.red)),
          TextSpan(
              text: "Hello Flutter", style: TextStyle(color: Colors.green)),
          WidgetSpan(child: Icon(Icons.favorite, color: Colors.red)),
          TextSpan(text: "Hello Dart", style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}

/// Text的使用Demo
/// 注意：Text并不是最终渲染的Widget，最终渲染的是RichText。
/// Text的父类是StatelessWidget，最终渲染的Widget是build()方法创建出来的RenderObjectWidget，即RichText。
class TextWidgetDemo extends StatelessWidget {
  final textContent = "《定风波》 苏轼 \n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。\n";
  // final textContent = "《定风波》 苏轼 莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。";

  @override
  Widget build(BuildContext context) {
    return Text(
      textContent,
      // 默认情况下，Text是包裹文字的，文字内容太少时可能看不出效果
      textAlign: TextAlign.center,
      // 文字最多显示2行
      maxLines: 3,
      // 文字超过2行时，显示...
      overflow: TextOverflow.ellipsis,
      // 缩放因子，默认是1
      textScaleFactor: 1,
      style: TextStyle(
        fontSize: 30,
        color: Colors.red,
        fontWeight: FontWeight.bold, // 字体加粗
      ),
    );
  }
}
