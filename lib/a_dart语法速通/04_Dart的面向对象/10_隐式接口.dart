main(List<String> args) {}

// Dart中没有哪一个关键字是来定义接口的
// 没有这些关键字interface/protocol
// 默认情况下挥所有的类都是隐式接口
class Runner {
  void running() {
    print("跑吧");
  }
}

class Flyer {
  void flying() {
    print("飞吧");
  }
}

// Dart只支持单继承
// class SuperMan extends Runner,Flyer{ // IDE报错：Each class definition can hava at most one extends clause.
// }

// 当将一个类当做接口使用时，那么实现这个接口的类，必须实现这个接口中所有方法（不可以在这些方法里使用super）
class SuperMan implements Runner, Flyer {
  @override
  void flying() {
    // super.flying(); // IDE报错：The method 'flying' is always abstract in the supertype.
  }

  @override
  void running() {}
}
