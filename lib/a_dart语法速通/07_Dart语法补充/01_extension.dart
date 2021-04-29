main(List<String> args) {
  final name = "GitLqr";
  print(name.sayHello());
  print(name * 3);
  print(name.size);
}

extension StringExt on String {
  String sayHello() {
    return "hello $this";
  }

  operator *(int count) {
    String result = "";
    for (var i = 0; i < count; i++) {
      result += this;
    }
    return result;
  }

  int get size {
    return this.length;
  }
}
