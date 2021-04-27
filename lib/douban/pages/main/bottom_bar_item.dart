import 'package:flutter/material.dart';

class BottomBarItem extends BottomNavigationBarItem {
  BottomBarItem(String iconName, String label)
      : super(
          label: label,
          icon: Image.asset(
            "assets/images/tabbar/$iconName.png",
            width: 32,
            gaplessPlayback: true, // 无间隙播放(取消图片加载动画)
          ),
          activeIcon: Image.asset(
            "assets/images/tabbar/${iconName}_active.png",
            width: 32,
            gaplessPlayback: true, // 无间隙播放(取消图片加载动画)
          ),
        );
}
