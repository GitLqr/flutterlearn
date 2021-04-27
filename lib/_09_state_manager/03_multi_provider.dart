import 'package:flutter/material.dart';
import 'model/user_info.dart';
import 'viewmodel/counter_view_model.dart';
import 'viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

// main() {
//   runApp(ChangeNotifierProvider(
//     create: (ctx) => CounterViewModel(),
//     child: ChangeNotifierProvider(
//       create: (ctx) => UserViewModel(),
//       child: MyApp(),
//     ),
//   ));
// }

main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => CounterViewModel()),
        ChangeNotifierProvider(
          create: (ctx) => UserViewModel(UserInfo('lqr', 18, 'CharyLin')),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("基础Widget")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShowData1(),
            ShowData2(),
            ShowData3(),
          ],
        ),
      ),
    );
  }
}

class ShowData1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = Provider.of<CounterViewModel>(context).counter;
    return Card(
      color: Colors.blue,
      child: Text("当前计数: $counter", style: TextStyle(fontSize: 30)),
    );
  }
}

class ShowData2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterViewModel>(builder: (ctx, counterVM, child) {
      return Card(
        color: Colors.red,
        child:
            Text("当前计数: ${counterVM.counter}", style: TextStyle(fontSize: 30)),
      );
    });
  }
}

class ShowData3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<UserViewModel, CounterViewModel>(
      builder: (ctx, userVM, counterVM, child) {
        return Text(
          "nickname: ${userVM.userInfo.nickname} counter:${counterVM.counter}",
          style: TextStyle(fontSize: 30),
        );
      },
    );
  }
}
