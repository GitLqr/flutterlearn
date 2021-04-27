main(List<String> args) {
  var p1 = new Person("lqr", 18);
  var p2 = Person("lqr", 18);
}

class Person {
  String name;
  int age;

  // Person(String name, int age) {
  //   this.name = name;
  //   this.age = age;
  // }

  Person(this.name, this.age);
}
