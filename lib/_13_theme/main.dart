import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 1. 亮度
        brightness: Brightness.light,
        // 2. primarySwatch传入不是Color，而是MaterialColor(包含了primaryColor和accentColor)
        primarySwatch: Colors.blue,
        // 3. primaryColor：单独设置导航和TabBar的颜色
        primaryColor: Colors.orange,
        // 4. accentColor：单独设置FloatingActionButton、Switch的颜色
        accentColor: Colors.green,
        // 5. Button主题
        buttonTheme: ButtonThemeData(
          height: 25,
          minWidth: 10,
          buttonColor: Colors.yellow,
        ),
        // 6. Card主题
        cardTheme: CardTheme(
          color: Colors.greenAccent,
          elevation: 10,
        ),
        // 7. Text主题
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 16),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页")),
      body: Center(
        child: Column(
          children: [
            Text("Hello World"),
            Text("Hello World", style: Theme.of(context).textTheme.bodyText1),
            Switch(value: true, onChanged: (value) {}),
            CupertinoSwitch(
              value: true,
              onChanged: (value) {},
              activeColor: Colors.red,
            ),
            RaisedButton(child: Text("R"), onPressed: () {}),
            Card(child: Text("Hello, GitLqr", style: TextStyle(fontSize: 50))),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "首页",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "分类",
            icon: Icon(Icons.category),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => DetailPage()),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      // 创建一个完全新的主题
      // data: ThemeData(
      //   primaryColor: Colors.purple,
      // ),
      // 沿用父主题，修改一部分
      data: Theme.of(context).copyWith(
        primaryColor: Colors.purple,
        accentColor: Colors.pink, // 无法修改FAB的颜色
        // 必须修改colorScheme才能修改FAB颜色
        colorScheme: Theme.of(context).colorScheme.copyWith(
              secondary: Colors.pink,
            ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("详情页"),
        ),
        body: Center(
          child: Text("detail page"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.pets),
          onPressed: () {},
        ),
      ),
    );
  }
}
