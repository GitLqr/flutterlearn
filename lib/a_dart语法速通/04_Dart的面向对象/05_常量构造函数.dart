main(List<String> args) {
  const p1 = Person("lqr", 18);
  const p2 = Person("lqr", 18);
  print(identical(p1, p2)); // true

  var p11 = Person("lqr", 18); // ==> var p11 = new Person("lqr");
  var p22 = Person("lqr", 18);
  print(identical(p11, p22)); // false

  var p111 = const Person("lqr", 18);
  var p222 = const Person("lqr", 18);
  print(identical(p111, p222)); // true

  const p1111 = Person("lqr", 18);
  const p2222 = Person("lqr", 20);
  print(identical(p1111, p2222)); // false
}

class Person {
  // 拥有常量构造方法的类中，所有的成员变量必须是final修饰
  final String name;
  final int age;

  // 一个类中只能有一个常量构造方法，命名构造方法也不行
  // const Person(this.name);
  const Person(this.name, this.age);
}
