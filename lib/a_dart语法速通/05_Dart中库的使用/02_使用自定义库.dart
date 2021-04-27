// import 'utils/math_utils.dart';
//
// main(List<String> args) {
//   sum(20, 30);
//   print(sum(20, 30)); // IDE报错：This experssion has a type of 'void' so its value can't be used.
// }
//
// void sum(num1, num2) {
//   print(num1 + num2);
// }

// // 补充一：as关键字给库起别名
// import 'utils/math_utils.dart' as mUtils;
//
// main(List<String> args) {
//   print(mUtils.sum(20, 30));
// }
//
// void sum(sum1, sum2) {
//   print(sum1 + sum2);
// }

/**
 * 补充二：默认情况下导入一个库时，导入这个库中所有的内容
 *    * show：执行要导入的内容
 *    * hide：隐藏某个要导入的内容，导入其它内容
 */
// // import "utils/math_utils.dart" show sum, mul;
// import "utils/math_utils.dart" show sum;
//
// main(List<String> args) {
//   print(sum(20, 30));
//   print(mul(20, 30)); // IDE报错：The function 'mul' isn't defined.
// }

// // import "utils/math_utils.dart" hide sum, mul;
// import "utils/math_utils.dart" hide sum;
//
// main(List<String> args) {
//   print(sum(20, 30)); // IDE报错：The function 'sum' isn't defined.
//   print(mul(20, 30));
// }

// // 补充三：公共的dart文件的抽取：export
// // 手动导入n个库太麻烦，可以在一个dart中用export统一导入
// // import 'utils/math_utils.dart';
// // import 'utils/date_utils.dart';
// import 'utils/utils.dart';
//
// main(List<String> args) {
//   print(sum(20, 30));
//   print(dateFormat());
//
//   print(_min(20, 30)); // IDE报错：
// }

// // 补充四：方法名前_可以将方法变成"私有"，其他dart文件无法调用。
// import 'utils/utils.dart';
//
// main(List<String> args) {
//   print(_min(20, 30)); // IDE报错：The function '_min' isn't defined.
// }
