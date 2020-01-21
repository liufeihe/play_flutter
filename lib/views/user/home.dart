import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:play_flutter/utils/locale.dart';
import 'package:play_flutter/utils/translate.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  Locale currentLan;
  List<String> routeNames = [
    'lifeCycle',
    'other',
  ];

  List<Widget> _getWidgets(){
    List<Widget> widgets = [];
    for(var routeName in routeNames){
      widgets.add(_HomeItem(routeName));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(LBLocalizations.of(context).title),
        title: Text(TranslateHandler.text(context, 'home.title')),
      ),
      // drawer: ,
      body: Center(
        child: Column(
          children: _getWidgets(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text(
          TranslateHandler.text(context, 'button.switch'),
        ),
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

class _HomeItem extends StatelessWidget {
  final String routeName;

  _HomeItem(
    this.routeName,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/$routeName');
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(TranslateHandler.text(context, 'home.$routeName.title')),
      ),
    );
  }
}