import 'dart:math';

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
      appBar: AppBar(title: Text("滚动Widget")),
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
  Widget build(BuildContext context) {
    return GridViewDemo1();
  }
}

class GridViewDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// GridView
    /// GridView.count()
    /// GridView.extent()
    /// GridView.builder() : 当item将显示的时候创建
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(256),
              Random().nextInt(256), Random().nextInt(256)),
        );
      },
    );
  }
}

class GridViewDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      /// SliverGridDelegateWithMaxCrossAxisExtent: 交叉轴上item最大范围(几列交给flutter算)
      /// 简写: GridView.extent(maxCrossAxisExtent: 400)
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.8,
      ),
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(
            255,
            Random().nextInt(256),
            Random().nextInt(256),
            Random().nextInt(256),
          ),
        );
      }),
    );
  }
}

class GridViewDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// SliverGridDelegateWithFixedCrossAxisCount: 交叉轴固定item个数(几列我们自己定)
    /// 简写: GridView.count(crossAxisCount: 3)
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: .8, // ratio = 宽度 / 高度
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(
            255,
            Random().nextInt(256),
            Random().nextInt(256),
            Random().nextInt(256),
          ),
        );
      }),
    );
  }
}
