main(List<String> args) {
  // 1. 明确的声明
  String name = "lqr";

  // 2. 类型推导(var/final/const)
  // 类型推导的方式虽然没有明确的指定变量的类型，但是变量是有自己明确的类型的
  // 2.1 var声明变量
  var age = 18;
  // age = "abc"; // IDE报错：A value of type 'String' can't be assigned to a variable of type 'int'.

  // 2.2 final声明常量
  final height = 1.88;
  // height = 2.00; // IDE报错：The final variable 'height' can only be set once.

  // 2.3 const声明常量
  const address = "广州市";
  // address = "北京市"; // IDE报错：Constant variables can't be assigned a value.

  // 2.4 final和const的区别
  // const必须赋值 常量值（编译期间需要有一个确定的值）
  // final可以通过计算/函数获取一个值（运行期间来确定一个值）
  // const date1 = DateTime.now(); // 写法错误
  final date2 = DateTime.now();

  // final用的更多一点
  // p1和p2是不是同一个对象
  // final p1 = new Person("lqr"); // new可以省略
  final p1 = Person("lqr");
  final p2 = Person("lqr");
  print(identical(p1, p2)); // false

  // 在Dart2.0之后，const可以省略
  // const p1 = const ConstPerson("lqr");
  const cp1 = ConstPerson("lqr");
  const cp2 = ConstPerson("lqr");
  const cp3 = ConstPerson("lxf");
  print(identical(cp1, cp2)); // true
  print(identical(cp1, cp3)); // false
}

class Person {
  String name;

  Person(String name) {
    this.name = name;
  }
}

class ConstPerson {
  final String name;

  const ConstPerson(this.name);
}
