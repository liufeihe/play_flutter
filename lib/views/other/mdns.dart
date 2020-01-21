import 'package:flutter/material.dart';
import 'package:play_flutter/utils/mdns.dart';
import 'package:play_flutter/utils/translate.dart';

class Mdns extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MdnsState();
  }
}

class _MdnsState extends State<Mdns> {

  void _startMdns() {
    MDNS.startMDNS('_lebai._tcp.');
  }

  @override
  void initState() {
    super.initState();
    _startMdns();
  }

  @override
  void dispose() {
    MDNS.stopMDNS();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslateHandler.text(context, 'other.mdns.title')
        ),
      ),
      body: Column(
        children: <Widget>[
          
        ],
      ),
    );
  }
}