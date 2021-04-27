main(List<String> args) {
  final superMan = SuperMan();
  superMan.eating(); // 动作吃东西
  superMan.running(); // running（调用的是混入类Runner中的running()）
  superMan.flying(); // flying
}

class Animal {
  void eating() {
    print("动作吃东西");
  }

  void running() {
    print("动物running");
  }
}

mixin Runner {
  void running() {
    print("running");
  }
}

mixin Flyer {
  void flying() {
    print("flying");
  }
}

class SuperMan extends Animal with Runner, Flyer {}
