import 'package:flutter/material.dart';

// class ImageDemo01 extends StatelessWidget {
//   final imageUrl =
//       "https://cdn.jsdelivr.net/gh/FullStackAction/PicBed@resource/image/FSA_QR_bottom.png";
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.red,
//
//       // 简单写法
//       // Image.network(imageUrl);
//
//       child: Image(
//         image: NetworkImage(imageUrl),
//         width: 200,
//         height: 200,
//         // fit: BoxFit.fill, // 拉伸
//         // fit: BoxFit.contain, // 内容填充到最长的一边贴边
//         // fit: BoxFit.cover, // 内容填充到最短的一边贴边
//         // fit: BoxFit.fitWidth, // 宽度一定，高度自适应
//         // fit: BoxFit.fitHeight, //高度一定，宽度自适应
//         // 左上角是(-1, -1)，右下角是(1, 1)
//         // alignment: Alignment.center,
//         alignment: Alignment(0, -1),
//         // // color不是背景色，而是用于图像混入的颜色
//         // color: Colors.green,
//         // // 颜色混入模式
//         // colorBlendMode: BlendMode.colorDodge,
//         repeat: ImageRepeat.repeatY,
//       ),
//     );
//   }
// }

class ImageDemo01 extends StatelessWidget {
  final imageUrl =
      "https://cdn.jsdelivr.net/gh/FullStackAction/PicBed@resource/image/FSA_QR_bottom.png";

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      crossAxisCount: 3,
      children: [
        wrapItem(
          Image(image: NetworkImage(imageUrl)),
          "NetworkImage",
        ),
        wrapItem(
          Image.network(imageUrl),
          "Image.network()",
        ),
        Container(),
        wrapItem(
          Image.network(imageUrl, fit: BoxFit.fill), // 拉伸
          "BoxFit.fill",
        ),
        wrapItem(
          Image.network(imageUrl, fit: BoxFit.contain), // 内容填充到最长的一边贴边
          "BoxFit.contain",
        ),
        wrapItem(
          Image.network(imageUrl, fit: BoxFit.cover), // 内容填充到最短的一边贴边
          "BoxFit.cover",
        ),
        wrapItem(
          Image.network(imageUrl, fit: BoxFit.fitWidth), // 宽度一定，高度自适应
          "BoxFit.fitWidth",
        ),
        wrapItem(
          Image.network(imageUrl, fit: BoxFit.fitHeight), //高度一定，宽度自适应
          "BoxFit.fitHeight",
        ),
        Container(),
        wrapItem(
          Image.network(imageUrl, alignment: Alignment.bottomCenter),
          "Alignment.topLeft",
        ),
        wrapItem(
          Image.network(imageUrl, alignment: Alignment.center),
          "Alignment.center",
        ),
        wrapItem(
          // 左上角是(-1, -1)，右下角是(1, 1)
          Image.network(imageUrl, alignment: Alignment(0, -1)),
          "Alignment(0, -1)",
        ),
        wrapItem(
          // color不是背景色，而是用于图像混入的颜色，配合 colorBlendMode 使用
          Image.network(imageUrl,
              color: Colors.green, colorBlendMode: BlendMode.colorDodge),
          "BlendMode.colorDodge",
        ),
        wrapItem(
          Image.network(imageUrl, repeat: ImageRepeat.repeatY),
          "ImageRepeat.repeatY",
        ),
      ],
    );
  }

  Widget wrapItem(Widget widget, String tip) {
    Text genTip(String tip) {
      return Text(
        tip,
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
          backgroundColor: Colors.black,
        ),
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(color: Colors.red[100], child: widget),
        Positioned(left: 4, bottom: 4, child: genTip(tip)),
      ],
    );
  }
}

class ImageDemo02 extends StatelessWidget {
  const ImageDemo02({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 简单写法
    // Image.asset('assets/images/FSA_QR.png');

    return Image(
      // 1. 在Flutter项目中创建一个文件夹，存储图片
      // 2. 在pubspec.yaml进行配置
      // 3. 使用图片
      /// assets:
      ///   - assets/images/FSA_QR.png
      ///   - assets/images/
      ///   - assets/images/*
      image: AssetImage('assets/images/FSA_QR.png'),
    );
  }
}
