import 'package:flutter/material.dart';

class AppState {
  final Locale locale;

  AppState({
    this.locale,
  });

  factory AppState.initial()=>AppState(
    locale: Locale('zh-CN'),
  );

  
}