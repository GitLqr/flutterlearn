import 'package:flutter/material.dart';
import 'package:flutterlearn/douban/pages/home/home.dart';
import 'package:flutterlearn/douban/pages/main/bottom_bar_item.dart';
import 'package:flutterlearn/douban/pages/subject/subject.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomePage(),
          SubjectPage(),
          SubjectPage(),
          SubjectPage(),
          SubjectPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        // 默认shifting, 当超过4个item会不显示底部文字, fixed则不管多少item都是显示
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomBarItem("home", "首页"),
          BottomBarItem("subject", "书影音"),
          BottomBarItem("group", "小组"),
          BottomBarItem("mall", "市集"),
          BottomBarItem("profile", "我的"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
