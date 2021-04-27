import 'package:flutter/material.dart';
import 'package:flutterlearn/douban/pages/main/main.dart';
import 'package:flutterlearn/douban/widgets/star_rating.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent, // 高亮颜色(改成透明可以去除水波纹)
      ),
      // home: HomePage(),
      home: MainPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("豆瓣App"),
      ),
      // body: Center(child: StarRating(rating: 8.3, count: 10)),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(
      //         width: 200,
      //         child: DashedLine(dashedWidth: 8, count: 15),
      //       ),
      //       Container(
      //         height: 200,
      //         child:
      //             DashedLine(axis: Axis.vertical, dashedHeight: 6, count: 12),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
