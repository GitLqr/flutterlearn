main(List<String> args) {
  // final s = Shape(); // IDE报错：Abstract classes can't be instantiated.
  // 抽象类有factory构造函数的话就不会报错
}

// 注意2：抽象类不能实例化
abstract class Shape {
  int getArea();

  String getInfo() {
    return "形状";
  }

  // Shape._internal() {}
  //
  // factory Shape() {
  //   return Rectangle();
  // }
}

// 注意1：继承自抽象类后，必须实现抽象类的抽象方法
class Rectangle extends Shape {
  // Rectangle() : super._internal() {}

  @override
  int getArea() {
    return 100;
  }
}
