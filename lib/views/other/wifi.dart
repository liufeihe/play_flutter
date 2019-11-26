import 'package:flutter/material.dart';
import 'package:wifi/wifi.dart';

class WifiList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WifiListState();
  }
}

class _WifiListState extends State<WifiList> {
  List<WifiResult> wifiList = [];

  void _getWifiList() async {
    wifiList = await Wifi.list(null);
  }

  @override
  void initState() {
    super.initState();
    _getWifiList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(),
    );
  }
}