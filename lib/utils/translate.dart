import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class TranslateHandler {
  static List<String> supportedLans = ['zh-CN', 'en'];
  static List<Locale> supportedLocales = [Locale('zh', 'CN'), Locale('en', 'US')];

  static String text(context, path, [params]){
    return FlutterI18n.translate(context, path, params);
  }

  static String getCurrentLan(context){
    return FlutterI18n.currentLocale(context).languageCode;
  }
}