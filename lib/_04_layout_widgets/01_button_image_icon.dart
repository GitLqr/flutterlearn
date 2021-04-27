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
      appBar: AppBar(title: Text("基础Widget")),
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
    // return ButtonExtensionDemo();
    // return ImageExtensionDemo();
    return IconExtensionDemo();
  }
}

class IconExtensionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Icon字体图标和图片图标
    /// 1. 字体图标是矢量图（放大的时候不会失真）
    /// 2. 字体图标可以设置颜色
    /// 3. 图标很多时，字体图标占据空间更小
    // return Icon(Icons.pets, size: 300, color: Colors.orange);
    // return Icon(IconData(0xe90e, fontFamily: 'MaterialIcons'),size: 300,color: Colors.orange);

    /// 1. 使用Text显示字体图标时，需要将字体编码 -> unicode编码
    /// 2. 设置对应的字体fontFamily
    // return Text("0xe90e", style: TextStyle(fontSize: 100, color: Colors.orange));
    return Text(
      "\ue90e",
      style: TextStyle(
        fontSize: 100,
        color: Colors.orange,
        fontFamily: 'MaterialIcons',
      ),
    );
  }
}

class ImageExtensionDemo extends StatelessWidget {
  final imageUrl =
      "https://up.enterdesk.com/edpic_source/ab/a0/40/aba040ce2daa32fa9cb0cc624b385c0a.jpg";

  @override
  Widget build(BuildContext context) {
    /// 1. 占位图：FadeInImage
    /// 2. 图片缓存：Flutter会自动进行图片缓存（默认最多缓存1000张，缓存空间最多100m）
    /// https://api.flutter.dev/flutter/widgets/Image-class.html
    /// https://api.flutter.dev/flutter/painting/ImageCache-class.html
    return FadeInImage(
      fadeInDuration: Duration(milliseconds: 1),
      fadeOutDuration: Duration(milliseconds: 1),
      placeholder: AssetImage("assets/images/FSA_QR.png"),
      image: NetworkImage(imageUrl),
    );
  }
}

class ButtonExtensionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// 1. 默认情况下Button上下有一定有间隔
        ///   MaterialTapTargetSize.padded：当按钮宽(或高)不足48px时，就把宽(或高)扩展到48px。
        ///   MaterialTapTargetSize.shrinkWrap：紧缩包裹，可以去除上下的间隔。
        FlatButton(
          color: Colors.red,
          child: Text("Flat Button1"),
          textColor: Colors.white,
          onPressed: () {},
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        FlatButton(
          color: Colors.red,
          child: Text("Flat Button2"),
          textColor: Colors.white,
          onPressed: () {},
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),

        /// 2. 修改按钮的最小宽度：ButtonTheme
        FlatButton(
          minWidth: 30,
          height: 30,
          color: Colors.red,
          child: Text(""),
          onPressed: () {},
        ),
        ButtonTheme(
          minWidth: 30,
          height: 30,
          child: FlatButton(
            color: Colors.red,
            child: Text(""),
            onPressed: () {},
          ),
        ),

        /// 3. 修改按钮的内间距
        FlatButton(
          padding: EdgeInsets.all(0),
          // 只能去除左右内间距，上下内间距可以指定一个固定height解决
          color: Colors.red,
          child: Text("Float Button3"),
          textColor: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }
}
