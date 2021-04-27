import 'package:flutter/material.dart';

class TextFieldDemo2 extends StatelessWidget {
  final usernameTextEditController = TextEditingController();
  final passwordTextEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: usernameTextEditController,
            decoration: InputDecoration(
              labelText: 'username',
              icon: Icon(Icons.people),
              hintText: '请输入用户名',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 8),
          TextField(
            controller: passwordTextEditController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'password',
              hintText: '请输入密码',
              icon: Icon(Icons.lock),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 8),
          Container(
            // width: 300,
            width: double.infinity,
            height: 40,
            child: FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("登录"),
              onPressed: () {
                // 1. 获取用户名和密码
                final username = usernameTextEditController.text;
                final password = passwordTextEditController.text;
                print("账号：$username , 密码：$password");
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(),
        TextField(
          decoration: InputDecoration(
            labelText: 'username(labelText)',
            icon: Icon(Icons.people),
            hintText: '请输入用户名(hintText)',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: '请输入用户名(hintText)',
          ),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            labelText: 'OutlineInputBorder',
            icon: Icon(Icons.people),
            border: OutlineInputBorder(),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'fillColor',
            icon: Icon(Icons.people),
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.red[100],
          ),
        ),
        TextField(
          decoration: InputDecoration(hintText: '监听事件'),
          onChanged: (value) => print("onChange:$value"), // 监听文字内容变化
          onSubmitted: (value) => print("onSubmitted:$value"), // 监听提交事件
        ),
        TextField(
          obscureText: true, // 模糊文本
          decoration: InputDecoration(
            labelText: 'password',
            icon: Icon(Icons.lock),
            border: OutlineInputBorder(),
          ),
        )
      ],
    );
  }
}
