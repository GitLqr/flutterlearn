main(List<String> args) {
  // list使用时的泛型写法：
  var names1 = ["abc", "cba", "nba", 111]; // List<Object>
  print(names1.runtimeType);
  var names2 = ["abc", "cba", "nba"]; // List<String>
  print(names2.runtimeType);

  // var names3 = <String>["abc", "cba", "nba", 111]; // IDE报错：The element type 'int' can't be assigned to the list type 'String'.
  var names3 = <String>["abc", "cba", "nba"]; // List<String>
  print(names3.runtimeType);
  List<String> names4 = ["abc", "cba", "nba"]; // List<String>
  print(names4.runtimeType);

  // Map使用时的泛型写法：
  var info1 = {
    "name": "lqr",
    "age": 18
  }; // _InternalLinkedHashMap<String, Object>
  print(info1.runtimeType);
  var info2 = <String, String>{
    'name': 'lqr',
    'age': '18'
  }; // _InternalLinkedHashMap<String, String>
  print(info2.runtimeType);
  Map<String, String> info3 = {
    'name': 'lqr',
    'age': '18'
  }; // _InternalLinkedHashMap<String, String>
  print(info3.runtimeType);

  // 类
  var point = Point<double>(1.23333, 1.9527); // Point<double>
  print(point.runtimeType);
  final pointX = point.setAndGetX(5.55);
  print(pointX); // 5.55
}

class Point<T extends num> {
  T x;
  T y;

  Point(this.x, this.y);

  T setAndGetX(T x) {
    this.x = x;
    return this.x;
  }
}
