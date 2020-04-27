import 'package:flutter/material.dart';
import 'package:play_flutter/views/feature/inherit.dart';
import 'package:play_flutter/views/feature/lifeCycle.dart';
import 'package:play_flutter/views/feature/lifeCycle2.dart';
import 'package:play_flutter/views/other/animation.dart';
import 'package:play_flutter/views/other/loading.dart';
import 'package:play_flutter/views/other/mdns.dart';
import 'package:play_flutter/views/other/qrCode.dart';
import 'package:play_flutter/views/other/test.dart';
import 'package:play_flutter/views/other/udp.dart';
import 'package:play_flutter/views/other/webViewWrapper.dart';
import 'package:play_flutter/views/user/home.dart';
import 'package:play_flutter/views/user/other.dart';

class Routes {
  static final Map<String, WidgetBuilder> appRoutes = {
     '/home': (context)=>Home(),

      '/lifeCycle': (context)=>LifeCycle(),
      '/lifeCycle2': (context)=>LifeCycle2(),
      '/inherit': (context)=>InheritRoute(),
      '/other': (context)=>Other(),

      '/loading': (context)=>Loading(),
      '/mdns': (context)=>Mdns(),
      '/animation':(context)=>JsonAnimation(),
      '/qrCode': (context)=>QrCode(),
      '/webViewWrapper': (context)=>WebViewWrapper(),
      '/udp': (context)=>Udp(),
      '/test': (context)=>Test(),
  };
}