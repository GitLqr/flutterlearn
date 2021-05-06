import 'package:flutter/material.dart';

class MyLocalizations {
  final Locale locale;

  MyLocalizations(this.locale);

  static MyLocalizations of(BuildContext context) {
    return Localizations.of(context, MyLocalizations);
  }

  static Map<String, Map<String, String>> _localizeValues = {
    "en": {
      "title": "Home",
      "hello": "Hello~",
      "pickTime": "Pick a Time~",
    },
    "zh": {
      "title": "首页",
      "hello": "您好~",
      "pickTime": "选择一个时间~",
    }
  };

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
