import 'package:flutter/material.dart';

class HomeAppBar extends AppBar {
  HomeAppBar(BuildContext context)
      : super(
            title: Text("美食广场"),
            leading: Builder(
              builder: (ctx) {
                return IconButton(
                  icon: Icon(Icons.build),
                  onPressed: () {
                    // 不能使用context，因为这个context是外界的，拿到的也只会是外界的Scaffold
                    // 所以，借助 Builder，延迟leading的初始化，这时的ctx就能拿到当前的Scaffold
                    Scaffold.of(ctx).openDrawer();
                  },
                );
              },
            ));
}
