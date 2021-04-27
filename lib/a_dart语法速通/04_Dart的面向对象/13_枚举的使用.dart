// 枚举：enum
main(List<String> args) {
  final color = Colors.red;
  switch (color) {
    case Colors.red:
      print("红色");
      break;
    case Colors.blue:
      print("蓝色");
      break;
    case Colors.green:
      print("绿色");
      break;
  }

  print(Colors.values); // [Colors.red, Colors.blue, Colors.green]
  print(Colors.red.index); // 0
}

enum Colors {
  red,
  blue,
  green,
}
