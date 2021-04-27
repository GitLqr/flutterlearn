import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearn/service/http_request.dart';

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
      appBar: AppBar(title: Text("基础Widget")),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  void initState() {
    super.initState();

    // 发送网络请求
    // 1. 创建Dio对象
    final dio = Dio();
    // 2. 发送网络请求
    // dio.get("https://httpbin.org/get").then((res) {
    //   print(res);
    // });
    // dio.post("https://httpbin.org/post").then((res) {
    //   print(res);
    // });
    HttpRequest.request("/get", params: {"name": "lqr"}).then((res) {
      print(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
