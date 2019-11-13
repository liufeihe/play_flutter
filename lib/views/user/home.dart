import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/animation');
              },
              child: Text('animation'),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/lifeCycle');
              },
              child: Text('lifeCylce'),
            ),
          ],
        ),
      ),
    );
  }
}