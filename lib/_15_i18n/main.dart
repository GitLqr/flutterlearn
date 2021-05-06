import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterlearn/_15_i18n/i18n/localizations.dart';
import 'package:flutterlearn/_15_i18n/i18n/localizations_delegate.dart';

main() => runApp(MyApp());

/// FlutterSDK控件的国际化步骤：
///     1. 在 pubspec.yaml 中增加国际化支持
///         dependencies:
///           flutter:
///             sdk: flutter
///           flutter_localizations:
///             sdk: flutter
///     2. iOS还需要在 info.plist 中配置 Localizations
///     3. 在 MaterialApp 中配置 supportedLocales
///
/// FlutterSDK控件的国际化步骤：
///     4. 在 MaterialApp 中配置 localizationsDelegates（如：[GlobalMaterialLocalizations.delegate]）
///
/// 自己工程中文本的国际化步骤：
///     4. 自定义一个 Localizations（如：[MyLocalizations]），使用Map，保存各种语种的翻译。
///     5. 自定义一个 LocalizationsDelegate（如：[MyLocalizationsDelegate]），加载自定义的 Localizations。
///     6. 在 MaterialApp 中配置 localizationsDelegates（追加自定义的 LocalizationsDelegate）
///     7. 使用 Localizations.of(context, MyLocalizations).xxx) 替换工程中的文本
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 支持的区域（语种）
      supportedLocales: [
        Locale("zh"),
        Locale("en"),
      ],
      // 要支持国际化的控件
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        MyLocalizationsDelegate.delegate,
      ],
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyLocalizations.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              MyLocalizations.of(context).hello,
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              child: Text(
                MyLocalizations.of(context).pickTime,
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
