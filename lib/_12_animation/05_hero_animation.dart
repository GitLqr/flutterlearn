import 'package:flutter/material.dart';
import 'package:flutterlearn/_11_router_manager/other.dart';
import 'package:flutterlearn/_12_animation/pages/image_detail.dart';

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
      appBar: AppBar(title: Text("Hero动画")),
      body: Center(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 16 / 9,
          ),
          children: List.generate(20, (index) {
            final imageUrl = "https://picsum.photos/500/500?random=$index";
            return GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (ctx) {
                //     return ImageDetailPage(imageUrl);
                //   }),
                // );
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (ctx, animation1, animation2) {
                      return FadeTransition(
                        opacity: animation1,
                        child: ImageDetailPage(imageUrl),
                      );
                    },
                  ),
                );
              },
              child: Hero(
                tag: imageUrl, // tag最好是唯一值
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.animation),
        onPressed: () {
          // 默认的转场
          Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => OtherPage(""),
          ));

          // 自定义转场
          // Navigator.of(context).push(
          //   PageRouteBuilder(
          //     transitionDuration: Duration(seconds: 2),
          //     pageBuilder: (ctx, animation1, animation2) {
          //       return FadeTransition(
          //         opacity: animation1,
          //         child: OtherPage(),
          //       );
          //     },
          //   ),
          // );
        },
      ),
    );
  }
}
