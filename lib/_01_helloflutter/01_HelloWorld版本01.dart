import 'package:flutter/material.dart';

// main() {
//   runApp(Center(
//     child: Text(
//       "Hello world",
//       textDirection: TextDirection.ltr,
//       style: TextStyle(
//         fontSize: 30,
//         color: Colors.orange,
//       ),
//     ),
//   ));
// }

main() {
  // 1. runApp 函数
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("第一个Flutter程序"),
      ),
      body: Center(
        child: Text(
          "Hello World",
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 30, color: Colors.orange),
        ),
      ),
    ),
  ));
}
