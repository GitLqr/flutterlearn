main(List<String> args) {
  final p1 = Person.withName("lqr");
  final p2 = Person.withName("lqr");
  print(identical(p1, p2));
}

class Person {
  String name;
  String color;

  // static 修饰的属性是类属性，可以通过类名直接调用
  static final Map<String, Person> _nameCache = {};

  Person(this.name, this.color);

  // 普通的构造函数：会自动返回创建出来的对象，不能手动返回
  // 工厂构造函数最大的特点：可以手动的返回一个对象
  factory Person.withName(String name) {
    if (_nameCache.containsKey(name)) {
      return _nameCache[name];
    } else {
      final p = Person(name, "default");
      _nameCache[name] = p;
      return p;
    }
  }
}
