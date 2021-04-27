import 'package:flutter/material.dart';

class ListViewDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return Text("Hello lqr: $index", style: TextStyle(fontSize: 20));
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.red,
          height: 40,
          // widget的高度
          thickness: 10,
          // 分割线的厚度
          indent: 10,
          // 分割线前端的空隙
          endIndent: 30, // 分割线末端的空隙
        );
      },
    );
  }
}

class ListViewDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemExtent: 60,
      itemBuilder: (BuildContext context, int index) {
        return Text("Hello lqr: $index", style: TextStyle(fontSize: 20));
      },
    );
  }
}

class ListViewDemo1 extends StatelessWidget {
  /// ListView(): 当children比较明确, 数量较少的时候可以使用, item一次性全部加载
  /// ListView.builder(): children数量较多的时候使用, 在item即将展示出来的时候才会被创建
  /// ListView.custom()
  /// ListView.separated()
  @override
  Widget build(BuildContext context) {
    return ListView(
      // scrollDirection: Axis.horizontal, // 滚动方向
      // itemExtent: 100, // item在scrollDirection方向上的尺寸
      reverse: true,
      children: List.generate(100, (index) {
        // return Text("Hello lqr : $index", style: TextStyle(fontSize: 30));
        return ListTile(
          leading: Icon(Icons.people),
          trailing: Icon(Icons.delete),
          title: Text("联系人$index"),
          subtitle: Text("联系人电话号码:18812345678"),
        );
      }),
    );
  }
}
