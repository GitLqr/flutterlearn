main(List<String> args) {
  // 1. 定义字符串
  var str1 = 'abc';
  var str2 = "abc";
  var str3 = """
  abc
  cba
  nba
  """;
  print("a'b'c"); // a'b'c
  print('a"b"c'); // a"b"c

  // 2. 字符串和表达式拼接
  var name = "lqr";
  var age = 19;
  var height = 1.88;
  // 强调：${变量}可以省略{}
  // var message1 = "my name is ${name}, age is ${age}, height is ${height}";
  var message1 = "my name is $name, age is $age, height is $height"; // my name is lqr, age is 19, height is 1.88
  var message2 = "name is $name, type is ${name.runtimeType}"; // name is lqr, type is String
  print(message1);
  print(message2);
}
