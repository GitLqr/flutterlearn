import 'package:flutter/material.dart';

/// 所有的Widget类中都不能定义状态，类成员属性必须是final
class ContentBody extends StatelessWidget {
  // IDE报错：This class (or a class that this class inherits from) is marked as '@immutable', but one of more of its instance fields aren't final: ContentBody.flag

  // 错误代码
  // @immutable 注释过的类，成员属性必须是final的
  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(value: flag, onChanged: (value) => flag = value),
          Text("同意协议", style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
