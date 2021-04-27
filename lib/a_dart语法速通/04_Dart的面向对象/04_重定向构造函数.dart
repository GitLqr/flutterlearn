main(List<String> args) {
  var p = Person("lqr");
  print(p.age); // 没有重定向时为null，有重定向后为0
}

class Person {
  String name;
  int age;

  // 构造函数的重定向
  Person(String name) : this._internal(name, 0);

  Person._internal(this.name, this.age);
}
