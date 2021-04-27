main(List<String> args) {
  sayHello1("lqr");

  sayHello2("lqr");
  sayHello2("lqr", 18, 1.88);

  sayHello3("lqr", age: 18, height: 1.88);
  sayHello3("lqr", height: 1.88, age: 18);
  sayHello3("lqr", height: 1.88);
}

// 必选参数：必须传
void sayHello1(String name) {
  print(name);
}
// Dart中没有函数的重载
// void sayHello1(){ // IDE报错：The name 'sayHello1' is already defined.
//   ...
// }

// 可选参数：位置可选参数 命名可选参数
// 位置可选参数：[int age, double height]
// 实参和形参在进行匹配时，是根据位置来匹配
void sayHello2(String name, [int age, double height]) {}

// 命名可选参数
void sayHello3(String name, {int age, double height}) {}

// 注意：只有可选参数才可以有默认值，必传参数没有默认值
void sayHello4(String name, [int age = 20, double height = 1.7]) {}

void sayHello5(String name, {int age = 20, double height = 1.7}) {}
