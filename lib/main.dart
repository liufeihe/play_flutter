import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:play_flutter/utils/translate.dart';
import 'package:play_flutter/views/feature/inherit.dart';
import 'package:play_flutter/views/feature/lifeCycle.dart';
import 'package:play_flutter/views/feature/lifeCycle2.dart';
import 'package:play_flutter/views/other/aliOss.dart';
import 'package:play_flutter/views/other/animation.dart';
import 'package:play_flutter/views/other/loading.dart';
import 'package:play_flutter/views/other/mdns.dart';
import 'package:play_flutter/views/other/qrCode.dart';
import 'package:play_flutter/views/other/webViewWrapper.dart';
import 'package:play_flutter/views/user/home.dart';
import 'package:play_flutter/views/user/other.dart';

// void main() async {
//   final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
//     useCountryCode: false,
//     fallbackFile: 'en',
//     path: 'assets/i18n',
//     forcedLocale: Locale('en'),
//   );
//   await flutterI18nDelegate.load(null);
//   runApp(MyApp(flutterI18nDelegate));
// }

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  // final FlutterI18nDelegate flutterI18nDelegate;

  // MyApp(
  //   this.flutterI18nDelegate,
  // );
    
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      routes: {
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
        
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // LBLocalizationsDelegate(),
        // flutterI18nDelegate,
        FlutterI18nDelegate(
          useCountryCode: false,
          fallbackFile: 'en',
          path: 'assets/i18n',
          forcedLocale: Locale('zh-CN'),
        ),
      ],
      supportedLocales: TranslateHandler.supportedLocales,
    );
  }
}
