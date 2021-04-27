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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final names = ["aaaa", "bbbb", "cccc"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LocalKey的案例解析")),
      body: ListView(
        children: names.map((item) {
          return ListItemLess(item);
          // return ListItemLess(item, key: ValueKey(item)); // ValueKey: 指定一个固定不变的值,可以让ElementTree在复用Element时保留与widget对应的Element
          // return ListItemLess(item, key: UniqueKey()); // UniqueKey: 每次build()都会生成一个新的hash值, 可以来用做强制刷新
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            names.removeAt(0);
          });
        },
      ),
    );
  }
}

class ListItemLess extends StatefulWidget {
  final String name;

  ListItemLess(this.name, {Key key}) : super(key: key);

  @override
  _ListItemLessState createState() => _ListItemLessState();
}

class _ListItemLessState extends State<ListItemLess> {
  final Color randomColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        widget.name,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
      height: 80,
      color: randomColor,
    );
  }
}
