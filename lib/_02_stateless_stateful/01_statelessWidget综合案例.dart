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
      appBar: AppBar(
        title: Text("商品列表"),
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Column 会越界relayoutBoundary，改成ListView就好了
    return ListView(
      children: [
        HomeProductItem("Apple1", "Macbook1",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        SizedBox(height: 6),
        HomeProductItem("Apple2", "Macbook2",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        SizedBox(height: 6),
        HomeProductItem("Apple3", "Macbook3",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
      ],
    );
  }
}

class HomeProductItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageURL;
  final style1 = TextStyle(fontSize: 25, color: Colors.orange);
  final style2 = TextStyle(fontSize: 20, color: Colors.green);

  HomeProductItem(this.title, this.desc, this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 5, // 设置边框的宽度
          color: Colors.pink, // 设置边框的颜色
        ),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Text(title, style: style1, textAlign: TextAlign.center),
          Text(title, style: style1),
          SizedBox(height: 8),
          Text(desc, style: style2),
          SizedBox(height: 8),
          Image.network(imageURL),
        ],
      ),
    );
  }
}
