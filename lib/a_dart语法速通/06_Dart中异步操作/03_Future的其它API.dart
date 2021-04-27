main(List<String> args) {
  print("main start");

  Future.value("Hello lqr").then((value) => print(value));
  Future.error("出错了").catchError((error) => print(error));
  Future.delayed(Duration(seconds: 3))
      .then((value) => "Hello lqr")
      .then((value) => print(value));
  Future.delayed(Duration(seconds: 2), () => "Hello lqr")
      .then((value) => print("welcome"))
      .then((value) => throw Exception("出错了"))
      .catchError((error) => print(error))
      .whenComplete(() => print("执行完成")); // 不管成功与否都会执行

  print("main end");
}
