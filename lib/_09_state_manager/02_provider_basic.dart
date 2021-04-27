import 'package:flutter/material.dart';
import 'viewmodel/counter_view_model.dart';
import 'package:provider/provider.dart';

/**
 * pubspec.yaml 依赖 provider: ^5.0.0
 * 使用 Provider 的三个步骤:
 * 1. 创建自己需要共享的数据
 * 2. 在应用程序的顶层创建ChangeNotifierProvider
 * 3. 在其它位置使用共享的数据
 *  > Provider.of(): 当Provider中的数据发生改变时, Provider.of() 所在的 Widget 整个 build() 方法都会重新构建.
 *  > Consumer: 当Provider中的数据发生改变时, 只会重新执行 Consumer 中的 build() 方法.
 *  > Selector: 1.selector(作用:对原来的数据进行转换) 2.shouldRebuild(作用:要不要重新构建)
 */
main() {
  /// 2. 在应用程序的顶层创建ChangeNotifierProvider
  runApp(ChangeNotifierProvider(
    create: (ctx) => CounterViewModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Provider的使用")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ShowData1(),
//             ShowData2(),
//           ],
//         ),
//       ),
//
//       /// Consumer可以通过child属性来表达部分widget复用, 不需要重新创建,
//       /// 但这里外层的FloatingActionButton还是会被重新创建的, 因为builder会被重新执行.
//       // floatingActionButton: Consumer<CounterViewModel>(
//       //   builder: (ctx, counterVM, child) {
//       //     return FloatingActionButton(
//       //       child: child,
//       //       onPressed: () {
//       //         counterVM.counter += 1;
//       //       },
//       //     );
//       //   },
//       //   child: Icon(Icons.add),
//       // ),
//
//       /// Selector比Consumer功能更多:
//       /// 1. selector: 支持数据进行一次转换处理
//       /// 2: shouldRebuild: 可以控制 builder 是否需要重新执行
//       floatingActionButton: Selector<CounterViewModel, CounterViewModel>(
//         // 这2个泛型表示数据转换前后的类型
//         selector: (ctx, counterVM) => counterVM, // 可以对数据做一次转换, 这里没有转换
//         builder: (ctx, counterVM, child) {
//           // 这里的counterVM是转换后的数据
//           return FloatingActionButton(
//             child: Icon(Icons.add),
//             onPressed: () {
//               counterVM.counter += 1;
//             },
//           );
//         },
//         shouldRebuild: (prev, next) => false, // 控制builder是否需要重新执行
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Provider的使用")),
//       body: Center(
//         child: Consumer<CounterViewModel>(
//           builder: (ctx, counterVM, child) {
//             return Text("当前计数: ${counterVM.counter}",
//                 style: TextStyle(fontSize: 30));
//           },
//         ),
//       ),
//       floatingActionButton: Consumer<CounterViewModel>(
//         builder: (ctx, counterVM, child) {
//           return FloatingActionButton(
//               child: child, onPressed: () => counterVM.counter += 1);
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Provider的使用")),
//       body: Center(
//         child: Text(
//           "当前计数: ${Provider.of<CounterViewModel>(context).counter}",
//           style: TextStyle(fontSize: 30),
//         ),
//       ),
//       floatingActionButton: Consumer<CounterViewModel>(
//         builder: (ctx, counterVM, child) {
//           return FloatingActionButton(
//               child: child, onPressed: () => counterVM.counter += 1);
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Provider的使用")),
      body: Center(
        child: Consumer<CounterViewModel>(
          builder: (ctx, counterVM, child) {
            return Text("当前计数: ${counterVM.counter}",
                style: TextStyle(fontSize: 30));
          },
        ),
      ),

      /// Selector比Consumer功能更多:
      /// 1. selector: 支持数据进行一次转换处理
      /// 2: shouldRebuild: 可以控制 builder 是否需要重新执行
      floatingActionButton: Selector<CounterViewModel, CounterViewModel>(
        // 这2个泛型表示数据转换前后的类型
        selector: (ctx, counterVM) => counterVM, // 可以对数据做一次转换, 这里没有转换
        builder: (ctx, counterVM, child) {
          // 这里的counterVM是转换后的数据
          return FloatingActionButton(
              child: Icon(Icons.add), onPressed: () => counterVM.counter += 1);
        },
        shouldRebuild: (prev, next) => false, // 控制builder是否需要重新执行
      ),
    );
  }
}

class ShowData1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 3. 在其它位置使用共享的数据
    int counter = Provider.of<CounterViewModel>(context).counter;
    print("data01的build()方法");
    return Card(
      color: Colors.blue,
      child: Text("当前计数: $counter", style: TextStyle(fontSize: 30)),
    );
  }
}

class ShowData2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("data02的build()方法");
    return Card(
      color: Colors.red,
      child: Consumer<CounterViewModel>(
        builder: (ctx, counterVM, child) {
          return Text("当前计数: ${counterVM.counter}",
              style: TextStyle(fontSize: 30));
        },
      ),
    );
  }
}
