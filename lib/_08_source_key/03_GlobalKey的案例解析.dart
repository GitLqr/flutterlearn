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
  final homeKey = GlobalKey<_HomeContentState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GlobalKey的案例解析")),
      body: HomeContent(key: homeKey),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.gesture),
        onPressed: () {
          print(homeKey.currentState.message);
          print(homeKey.currentState.widget.name);
          homeKey.currentState.test();
        },
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  final name = "GitLqr";

  HomeContent({Key key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final message = "hello lqr";

  void test() {
    print("test invoke");
  }

  @override
  Widget build(BuildContext context) {
    return Text(message, style: TextStyle(fontSize: 20));
  }
}
