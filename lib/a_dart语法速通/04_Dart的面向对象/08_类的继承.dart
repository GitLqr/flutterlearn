main(List<String> args) {}

class Animal {
  int age;

  Animal(this.age);

  void run() {
    print("向前跑~");
  }
}

class Person extends Animal {
  String name;

  // 必须在初始化列表中，调用父类的构造函数
  Person(this.name, int age) : super(age);

  @override
  void run() {
    // super.run();
    print("向前走～");
  }
}
