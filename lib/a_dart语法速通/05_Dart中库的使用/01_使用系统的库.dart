// Dart中任何一个dart文件都是一个库，即使你没有用关键字 library 声明

// import 'dart:io';
// import 'dart:isolate';
// import 'dart:async';
// import 'dart:math';

// 系统的库：import 'dart:库的名字';

import 'dart:math';

main(List<String> args) {
  final num1 = 20;
  final num2 = 30;
  print(min(num1, num2));
}
