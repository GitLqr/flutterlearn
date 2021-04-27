main(List<String> args) {
  print("main start");

  // 链式调用, 执行多个数据处理
  Future(() {
    return "第一次结果";
  }).then((value) {
    print(value);
    return "第二次结果";
  }).then((value) {
    print(value);
    return "第三次结果";
  }).then((value) {
    print(value);
  }).catchError((error) {
    print(error);
  });

  print("main end");
}
