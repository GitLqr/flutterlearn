import 'dart:io';

main(List<String> args) {
  print("main start");

  // await\async :
  // 可以用 同步的代码格式 实现 异步的调用过程
  // 通常一个async函数会返回一个Future
  getNetworkData().then((value) => print(value));

  print("main end");
}

/// 1. await 必须在 async 函数中使用
/// 2. async 函数返回的结果必须是一个Future
Future getNetworkData() async {
  await sleep(Duration(seconds: 3));
  // return Future.value("Hello lqr");
  return "Hello lqr"; // 会自动包裹成Future
}
