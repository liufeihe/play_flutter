import 'package:flutter/material.dart';
import 'package:play_flutter/utils/translate.dart';


class Other extends StatefulWidget{
  @override
  _OtherState createState() {
    return _OtherState();
  }
}

class _OtherState extends State<Other>{
  Locale currentLan;
  List<String> routeNames = [
    'loading',
    'mdns',
    'animation',
    'qrCode',
    // 'aliOss',
    'webViewWrapper',
    'udp',
    'test',
  ];

  List<Widget> _getWidgets(){
    List<Widget> widgets = [];
    for(var routeName in routeNames){
      widgets.add(_OtherItem(routeName));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TranslateHandler.text(context, 'other.title')),
      ),
      // drawer: ,
      body: Center(
        child: Column(
          children: _getWidgets(),
        ),
      ),
    );
  }
}

class _OtherItem extends StatelessWidget {
  final String routeName;

  _OtherItem(
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
        child: Text(
          TranslateHandler.text(context, 'other.$routeName.title')
        ),
      ),
    );
  }
}