import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearn/_15_i18n/i18n/localizations.dart';

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  static MyLocalizationsDelegate delegate = MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["zh", "en"].contains(locale.languageCode);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<MyLocalizations> old) {
    /// 当widget重新build的时候，是否需要重新加载一遍数据，一般情况下是不用的
    return false;
  }

  // @override
  // Future<MyLocalizations> load(Locale locale) {
  //   return SynchronousFuture(MyLocalizations(locale));
  // }

  @override
  Future<MyLocalizations> load(Locale locale) async {
    final localizations = MyLocalizations(locale);
    return await localizations.loadJson();
  }
}
