import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("基础Widget")),
      // body: HomeContent(),
      // 4. FloatingActionButton
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print("FloatingActionButton Click"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// 必传参数和@required的区别：
        /// 必传参数不传会报错（编译不通过）。
        /// @required参数不传编译可以通过，但是会报警告。
        // 1. 突出的Button（从 v1.25.0 过时，推荐使用 ElevatedButton）
        RaisedButton(
          child: Text("RaisedButton"),
          textColor: Colors.red, // 文字颜色（也可以在Text的style中设置）
          color: Colors.blue, // 按钮背景色
          onPressed: () => print("RaisedButton Click"),
        ),

        // 2. 扁平的Button（从 v1.25.0 过时，推荐使用 TextButton）
        FlatButton(
          child: Text("FlatButton"),
          color: Colors.orange,
          onPressed: () => print("FlatButton Click"),
        ),

        // 3. 边框Button（从 v1.25.0 过时，推荐使用 OutlinedButton）
        OutlineButton(
            child: Text("OutlineButton"),
            onPressed: () => print("OutlineButton Click")),

        // 4. FloatingActionButton，一般用在Scaffold中
        // FloatingActionButton(onPressed: onPressed)

        // 5. 自定义Button：图标-文字-背景-圆角
        FlatButton(
          color: Colors.amberAccent,
          shape: RoundedRectangleBorder(
            // 圆角
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min, // 默认是max，占满父Widget；min是包裹内容
            children: [
              Icon(Icons.favorite, color: Colors.red), // 图标
              Text("喜欢作者"), // 文字
            ],
          ),
          onPressed: () => print("自定义Button"), // onPressed必传，否则样式可能会出问题
        )
      ],
    );
  }
}
