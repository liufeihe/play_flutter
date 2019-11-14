import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:play_flutter/utils/locale.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  Locale currentLan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(LBLocalizations.of(context).title),
        title: Text(FlutterI18n.translate(context, 'home.title')),
      ),
      // drawer: ,
      body: Center(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/animation');
              },
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(FlutterI18n.translate(context, 'home.animation')),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/lifeCycle');
              },
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(FlutterI18n.translate(context, 'home.life-cycle')),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('switch'),
        onPressed: () async {
          currentLan = FlutterI18n.currentLocale(context);
          currentLan = Locale(currentLan.languageCode=='en'?'zh-CN':'en');
          setState(() {
            currentLan = currentLan;
          });
          await FlutterI18n.refresh(context, currentLan);
          
        },
      ),
    );
  }
}