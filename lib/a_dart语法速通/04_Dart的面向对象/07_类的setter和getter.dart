main(List<String> args) {
  final p1 = Person();
  p1.name = "";

  // p1.setName("lqr"); // IDE报错：The method 'setName' isn't defined for the type 'Person'.
  p1.setName = "lqr";
  print(p1.getName); // lqr
}

class Person {
  String name;

  // setter
  // set setName(String name) {
  //   this.name = name;
  // }
  set setName(String name) => this.name = name;

  // getter：注意getter没有()
  // String get getName {
  //   return this.name;
  // }
  String get getName => this.name;
}
