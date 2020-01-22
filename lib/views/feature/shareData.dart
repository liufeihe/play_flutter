import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {
  final int data;

  ShareDataWidget({
    @required this.data,
    Widget child,
  }):super(child: child);

  static ShareDataWidget of(BuildContext context) {
    return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>().widget;
    // return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data!=data;
  }
}