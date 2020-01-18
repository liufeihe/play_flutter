import 'package:flutter/material.dart';
import 'package:play_flutter/utils/mdns.dart';

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
    return Center(
      child: Text('mdns'),
    );
  }
}