main(List<String> args) {
  // var p = Person();
  // p.name = "lqr";
  // p.run();
  // p.eat();

  // 级联运算符
  var p = Person()
    ..name = "lqr"
    ..eat()
    ..run();
}

class Person {
  String name;

  void run() {
    print("running");
  }

  void eat() {
    print("eating");
  }
}
