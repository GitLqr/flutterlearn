main(List<String> args) {
  // 1. 列表List：[];
  var names = ["abc", "cba", "nba", "cba"];
  names.add("mba");
  // names.remove(value);
  // names.removeAt(index);

  // 2. 集合Set：{};
  var movies = {"星际穿越", "大话西游", "盗梦空间"};
  names = Set<String>.from(names).toList(); // 可以用Set来去重
  print(names);

  // 3. 映射Map
  var info = {
    "name": "lqr",
    "age": 18,
  };
}
