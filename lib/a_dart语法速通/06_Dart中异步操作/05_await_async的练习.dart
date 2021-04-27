import 'dart:io';

main(List<String> args) {
  print("main start");

  getData();

  print("main end");
}

void getData() async {
  // // 链式调用
  // getNetworkData("argument1").then((res) {
  //   print(res);
  //   return getNetworkData(res);
  // }).then((res) {
  //   print(res);
  //   return getNetworkData(res);
  // }).then((res) {
  //   print(res);
  // });

  // 改写成 async/await
  var res1 = await getNetworkData("argument1");
  print(res1); // Hello lqr, argument1
  var res2 = await getNetworkData(res1);
  print(res2); // Hello lqr, Hello lqr, argument1
  var res3 = await getNetworkData(res2);
  print(res3); // Hello lqr, Hello lqr, Hello lqr, argument1
}

Future getNetworkData(String arg) {
  return Future(() {
    sleep(Duration(seconds: 3));
    return "Hello lqr, $arg";
  });
}
