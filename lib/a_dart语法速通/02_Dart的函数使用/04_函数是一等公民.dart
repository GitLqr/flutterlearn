main(List<String> args) {
  // test((name) {
  //   print(name); // lqr
  // });

  test((num1, num2) {
    return num1 + num2;
  });

  var demo1 = demo();
  print(demo1(20, 30)); // 600
}

// 封装test函数，要求：传入一个函数
// 缺点：Function无法对传入函数做限制
// void test(Function foo) {
//   foo("lqr");
// }

// 可以限制 作为参数的函数的类型
// 缺点：相当于在形参位置上写了一个函数声明（函数签名），整体看起来可读性差
// void test(int foo(int num1, int num2)) {
//   foo(20, 30);
// }

// 可以使用typedef定义一个函数类型
typedef Calculate = int Function(int num1, int num2);

void test(Calculate calc) {
  calc(20, 30);
}

// 函数作为返回值
Calculate demo() {
  return (num1, num2) {
    return num1 * num2;
  };
}
