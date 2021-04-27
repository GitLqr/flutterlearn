main(List<String> args) {
  var p = Person("lqr", age: 30);
  print(p.age);
}

class Person {
  final String name;
  final int age;

  // final double height;

  // Person(this.name, this.age) {}
  Person(this.name, {this.age = 10}) {}
  // Person(this.name) { // IDE报错：All final variables must be initialized, but 'age' isn't.
  //   this.age = 10; // IDE报错：'age' can't be used as a setter because it's final.
  // }

  // ):xxxxxx{ xxxxxx部分就是初始化列表
  // Person(this.name) : this.age = 10 {} // 初始化列表可以写表达式
  // Person(this.name, {this.age = 10}) {} // 这种方式只能写赋值语句
  // Person(this.name, {int age}) : this.age = age ?? 10 {}

  // Person(this.name, {int age, double height}) : this.age = age ?? 10, this.height = height ?? 1.88 {}
}
