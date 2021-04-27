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
      appBar: AppBar(title: Text("title")),
      body: HomeContent("hello world"),
    );
  }
}

// StatelessWidget 的生命周期
// class HomeContent extends StatelessWidget {
//   final String message;
//
//   HomeContent(this.message) {
//     print("构造函数被调用");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print("调用build方法");
//     return Text(message);
//   }
// }

class HomeContent extends StatefulWidget {
  HomeContent(String message) {
    print("1. 调用 HomeContent 的 constructor 方法");
  }

  @override
  _HomeContentState createState() {
    print("2. 调用 HomeContent 的 createState 方法");
    return _HomeContentState();
  }
}

class _HomeContentState extends State<HomeContent> {
  _HomeContentState() {
    print("3. 调用 _HomeContentState 的 constructor 方法");
  }

  @override
  void initState() {
    // 注意：这里必须调用super(@mustCallSuper)
    super.initState();
    print("4. 调用 _HomeContentState 的 initState 方法");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("调用 _HomeContentState 的 didChangeDependencies 方法");
  }

  @override
  void didUpdateWidget(covariant HomeContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("调用 _HomeContentState 的 didUpdateWidget 方法");
  }

  @override
  Widget build(BuildContext context) {
    print("5. 调用 _HomeContentState 的 build 方法");
    return Container();
  }

  @override
  void dispose() {
    super.dispose();
    print("6. 调用 _HomeContentState 的 dispose 方法");
  }
}
