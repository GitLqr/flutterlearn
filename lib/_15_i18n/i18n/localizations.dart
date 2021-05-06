import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyLocalizations {
  final Locale locale;

  MyLocalizations(this.locale);

  static MyLocalizations of(BuildContext context) {
    return Localizations.of(context, MyLocalizations);
  }

  static Map<String, Map<String, String>> _localizeValues = {};

  Future loadJson() async {
    // 1. 加载json文件
    final jsonString = await rootBundle.loadString("assets/i18n.json");
    // 2. 对json进行解析
    Map<String, dynamic> map = json.decode(jsonString);

    _localizeValues = map.map((key, value) {
      return MapEntry(key, value.cast<String, String>());
    });

    return _localizeValues;
  }

  String get title {
    return _localizeValues[locale.languageCode]['title'];
  }

  String get hello {
    return _localizeValues[locale.languageCode]['hello'];
  }

  String get pickTime {
    return _localizeValues[locale.languageCode]['pickTime'];
  }
}
