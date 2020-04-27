import 'package:flutter/material.dart';
import 'package:play_flutter/utils/cacheHandler.dart';
import 'package:play_flutter/utils/translate.dart';


class Test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestState();
  }
}

class _TestState extends State<Test> {

  String _data;

  void _init() async {
    String data = await CacheHandler.getTestData();
    if (data!=null) {
      if (mounted) {
        setState(() {
          _data = data;
        });
      }
    }
  }

  void _setText() async {
    _data = 'hello flutter';
    if (mounted) {
      setState(() {
        _data = _data;
      });
    }
  }

  void _clearText() async {
    _data = '';
    if (mounted) {
      setState(() {
        _data = _data;
      });
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    CacheHandler.saveTestData(_data);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslateHandler.text(context, 'other.udp.title')
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(_data??''),
          FlatButton(onPressed: (){
            _setText();
          }, child: Text('set text')),
          FlatButton(onPressed: (){
            _clearText();
          }, child: Text('clear text')),
        ],
      ),
    );
  }
}