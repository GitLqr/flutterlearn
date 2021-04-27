import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("InheritedWidget的使用")),
      body: CounterWidget(
        counter: _counter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ShowData1(), ShowData2()],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => setState(() => _counter++),
      ),
    );
  }
}

class CounterWidget extends InheritedWidget {
  // 1. 共享的数据
  final int counter;

  // 2. 自定义的构造方法
  CounterWidget({this.counter, @required Widget child}) : super(child: child);

  // 3. 获取Element树中最近的当前InheritedWidget对象
  static CounterWidget of(BuildContext context) {
    // 沿着Element树, 在祖先Element中找到最近的 CounterWidget对应的那个InheritedWidget, 并从中取出该Widget对象.
    return context.dependOnInheritedWidgetOfExactType();
  }

  // 4. 决定要不要回调State中的didChangeDependencies()
  @override
  bool updateShouldNotify(CounterWidget oldWidget) {
    // 值更新时是否通知 didChangeDependencies()
    /// 如果返回true: 执行 依赖当前的InheritedWidget的State 的 didChangeDependencies()
    // return true;
    return oldWidget.counter == this.counter;
  }
}

class ShowData1 extends StatefulWidget {
  @override
  _ShowData1State createState() => _ShowData1State();
}

class _ShowData1State extends State<ShowData1> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("执行了 _ShowData1State 中的 didChangeDependencies() ");
  }

  @override
  Widget build(BuildContext context) {
    int counter = CounterWidget.of(context).counter;
    return Card(
      color: Colors.red,
      child: Text("当前计数: $counter", style: TextStyle(fontSize: 30)),
    );
  }
}

class ShowData2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = CounterWidget.of(context).counter;
    // int counter = context.dependOnInheritedWidgetOfExactType<CounterWidget>().counter;
    return Card(
      color: Colors.blue,
      child: Text("当前计数: $counter", style: TextStyle(fontSize: 30)),
    );
  }
}
