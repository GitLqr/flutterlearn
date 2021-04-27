import 'dart:async';
import 'dart:io';

main(List<String> args) {
  print("main start");

  // 发送一个网络请求
  // var result = getNetworkData();
  // print(result); // Hello lqr
  // // Instance of 'Future<dynamic>'

  // 2. 拿到结果
  var future = getNetworkData();
  // future
  //     .then((value) => print(value)) // Hello lqr
  //     .catchError((err) => print(err))
  //     .whenComplete(() => print("执行完成")); // 不管成功与否都会执行

  // 错误写法:
  future.then((value) => print(value));
  future.catchError((error) => print(error));
  // // 分开写的正确写法:
  // future = future.then((value) {
  //   print(value);
  //   return value;
  // });
  // future.catchError((error) => print(error));

  print("main end");
}

// String getNetworkData() {
//   sleep(Duration(seconds: 5));
//   return "Hello lqr";
// }

// 不写泛型则返回的是 Future<dynamic>
Future<String> getNetworkData() {
  /// factory Future(FutureOr<T> computation())
  /// FutureOr: 联合类型

  // 1. 将耗时操作包裹到Future的回调函数中
  return Future<String>(() {
    sleep(Duration(seconds: 2));
    return "Hello lqr"; // 只要有返回结果, 那么就执行Future对应的then的回调(相当于Promise-resolve)
    // throw Exception("error"); // 如果没有结果返回(有错误信息), 需要在Future回调中抛出一个异常(相当于Promise-reject)
  });
}
