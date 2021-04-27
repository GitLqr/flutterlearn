main(List<String> args) {
  //　1. 创建Person对象
  var p = Person("lqr", 18);
  var p1 = new Person.withNameAgeHeight("lqr", 18, 1.88);
  var p2 = Person.fromMap({
    "name": "lqr",
    "age": 18,
    "height": 1.88,
  });

  // 2. 知识点：Object和dynamic的区别
  // 父类引用指向子类对象
  // Object 和 dynamic
  // Object调用方法时，编译时会报错
  // dynamic调用方法时，编译时不报错，但是运行时会存在安全隐患

  // Object obj = "lqr";
  // print(obj.substring(1)); // IDE报错：The method 'substring' isn't defined for the type 'Object'.

  // dynamic是明确声明
  // var是类型推导
  dynamic obj = "lqr";
  print(obj.substring(1)); // qr
}

class Person {
  String name;
  int age;
  double height;

  Person(this.name, this.age);

  // Dart中没有函数重载
  // Person(this.name, this.age, this.height); // IDE报错：The default constructor is already defined.

  // 命名构造函数
  Person.withNameAgeHeight(this.name, this.age, this.height);

  Person.fromMap(Map<String, dynamic> map) {
    this.name = map['name'];
    this.age = map['age'];
    this.height = map['height'];
  }

  @override
  String toString() {
    return "$name $age $height";
  }
}
