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
      // appBar: AppBar(title: Text("Sliver Demo")),
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
    return CustomScrollViewDemo2();
  }
}

class CustomScrollViewDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true, // AppBar是否固定, false: 随列表滚动
          expandedHeight: 300, // 扩展模式高度
          flexibleSpace: FlexibleSpaceBar(
            title: Text("微信公众号: FSA全栈行动"),
            background: Image.asset(
              'assets/images/FSA_QR.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 2,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                  color: Color.fromARGB(
                255,
                Random().nextInt(256),
                Random().nextInt(256),
                Random().nextInt(256),
              ));
            },
            childCount: 10,
          ),
        ),
        SliverList(delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.people),
              trailing: Icon(Icons.delete),
              title: Text("联系人 $index"),
            );
          },
        )),
      ],
    );
  }
}

class CustomScrollViewDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// - ScrollView:
    ///   - BoxScrollView: List<Widget> buildSlivers(BuildContext context) --> [sliver]
    ///     - ListView: Widget buildChildLayout(BuildContext context) --> SliverList
    ///     - GridView: Widget buildChildLayout(BuildContext context) --> SliverGrid
    ///   - CustomScrollView: List<Widget> buildSlivers(BuildContext context) --> [sliver, ...]
    ///
    ///
    /// CustomScrollView: 可以用来自由组合多种sliver:
    ///   - SliverList: 类似我们之前使用过的ListView
    ///   - SliverFixedExtentList: 类似于SliverList只是可以设置滚动的高度
    ///   - SliverGrid: 类似于我们之前使用的GridView
    ///   - SliverPadding: 设置Sliver的内边距, 因为可能要单独给Sliver设置内边距
    ///   - SliverAppBar: 添加一个AppBar, 通常用来作为CutomScrollView的HeaderView
    ///   - SliverSafeArea: 设置内容显示在安全区域 (比如不让齐刘海挡住我们的内容)
    ///
    ///
    /// SliverGrid
    ///   - gridDelegate: SliverGridDelegate
    ///     - SliverGridDelegateWithFixedCrossAxisCount
    ///     - SliverGridDelegateWithMaxCrossAxisExtent
    ///   - delegate: SliverChildDelegate
    ///     - SliverChildBuilderDelegate: builder按需加载
    ///     - SliverChildListDelegate: list全部加载
    // return CustomScrollView(
    //   slivers: [SliverGridItems()],
    // );

    /// 注意: 先把appBar去掉, 再看效果
    ///
    /// SafeArea:
    ///   - 作用: 让 顶部状态栏 \ 底部导航栏 这2个安全区不会被遮挡
    ///   - 对象: 包裹 widget
    /// SliverSafeArea:
    ///   - 作用: 让 顶部状态栏 \ 底部导航栏 这2个安全区不会被遮挡
    ///   - 对象: 包裹 sliver
    ///   - 优势: 可以让sliver中的内容滚到安全区时还能显示
    // return SafeArea(
    //   child: CustomScrollView(
    //     slivers: [SliverGridItems()],
    //   ),
    // );
    // return CustomScrollView(
    //   slivers: [SliverSafeArea(sliver: SliverGridItems())],
    // );

    /// Padding:
    ///   - 作用: 让列表四周出现内间距
    ///   - 对象: 包裹 widget
    ///   - 缺点: 列表滚动时, 内间距的部分无法显示列表内容
    /// SliverPadding:
    ///   - 作用: 让列表四周出现内间距
    ///   - 对象: 包裹 sliver
    ///   - 优点: 列表滚动时, 内间距的部分可以显示列表内容
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: CustomScrollView(
    //     slivers: [
    //       SliverGridItems(),
    //     ],
    //   ),
    // );
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(8.0),
          sliver: SliverGridItems(),
        ),
      ],
    );
  }

  SliverGrid SliverGridItems() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
              color: Color.fromARGB(255, Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256)));
        },
        childCount: 100,
      ),
    );
  }
}
