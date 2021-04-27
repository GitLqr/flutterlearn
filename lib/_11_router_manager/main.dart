import 'package:flutter/material.dart';
import 'package:flutterlearn/_11_router_manager/other.dart';

import 'about.dart';
import 'detail.dart';
import 'router/Routers.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routers.routes,
      // home: HomePage(),
      initialRoute: Routers.initialRoute, // 使用 initialRoute 代替 home
      onGenerateRoute: Routers.generateRoute,
      onUnknownRoute: Routers.unknowRoute,
    );
  }
}

class HomePage extends StatefulWidget {
  static const routeName = "/";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _homeMessage = "default message";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("路由")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _homeMessage,
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            ElevatedButton(
              child: Text("跳转到详情"),
              onPressed: () => _jumpToDetail(context),
            ),
            // ElevatedButton(
            //   child: Text("跳转到关于"),
            //   onPressed: () => _jumpToAbout(context),
            // ),
            // ElevatedButton(
            //   child: Text("跳转到详情"),
            //   onPressed: () => _jumpToDetail2(context),
            // ),
            // ElevatedButton(
            //   child: Text("跳转到设置"),
            //   onPressed: () => _jumpToSettings(context),
            // ),
            ElevatedButton(
              child: Text("跳转到未知页面"),
              onPressed: () => Navigator.of(context).pushNamed("/abc"),
            ),
            ElevatedButton(
              child: Text("跳转到详情(转场动画)"),
              onPressed: () {
                // // 默认转场动画
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (ctx) => OtherPage("hello GitLqr"),
                // ));

                // // 自定义转场动画
                // Navigator.of(context).push(PageRouteBuilder(
                //   transitionDuration: Duration(seconds: 1),
                //   pageBuilder: (ctx, animation1, animation2) {
                //     return FadeTransition(
                //       opacity: animation1,
                //       child: OtherPage("hello GitLqr(转场)"),
                //     );
                //   },
                // ));

                Navigator.of(context).pushNamed(OtherPage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _jumpToDetail(BuildContext context) {
    /// 1. 普通的跳转方式
    /// 传递参数: 通过构造器直接传递即可
    // Navigator.push(context, MaterialPageRoute(builder: (ctx) => DetailPage()));
    Future future = Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => DetailPage("a home message"),
    ));

    future.then((res) {
      setState(() {
        _homeMessage = res;
      });
    });
  }

  void _jumpToAbout(BuildContext context) {
    Navigator.of(context).pushNamed(
      AboutPage.routeName,
      arguments: "a home message",
    );
  }

  void _jumpToDetail2(BuildContext context) {
    Navigator.of(context)
        .pushNamed(DetailPage.routeName, arguments: "a home message");
  }

  void _jumpToSettings(BuildContext context) {
    Navigator.of(context).pushNamed("/settings");
  }
}
