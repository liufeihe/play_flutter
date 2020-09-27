import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:play_flutter/utils/translate.dart';
import 'package:udp/udp.dart';

class Udp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UdpState();
  }
}

class _UdpState extends State<Udp> {
  UDP receiver;
  Endpoint multicastEndpoint;
  int count=0;
  Set<String> ips = Set<String>();

  void createListener() async {
    multicastEndpoint = Endpoint.multicast(InternetAddress("224.0.0.251"), port: Port(5353));
    receiver = await UDP.bind(multicastEndpoint);
    receiver.listen((datagram) {
      if (datagram != null) {
        var str = String.fromCharCodes(datagram?.data);
        count++;
        print('receive: $count, address: ${datagram.address}, data: $str');
        ips.add(datagram.address.host);
        print('${ips.length}, $ips');
        // print(String.fromCharCodes(datagram.data));
        // stdout.write(str);
      }
    });
  }

  void _startUdp() async {
    createListener();

    var sender = await UDP.bind(multicastEndpoint);//Endpoint.any());
    var data = {
      'qname': "_lebai._tcp.",
      "qtype": 16,
      // "UNICAST-RESPONSE": 0,
      "qclass": 1,
    };
    String dataStr = json.encode(data);
    // print(dataStr.codeUnits);
  
    await sender.send(dataStr.codeUnits, multicastEndpoint);
    await Future.delayed(Duration(seconds:5));
    sender.close();
  }

  @override
  void initState() {
    super.initState();
    // createListener();
  }

  @override
  void dispose() {
    super.dispose();
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
        children: <Widget>[
          FlatButton(onPressed: (){
            _startUdp();
          }, child: Text('start udp'))
        ],
      ),
    );
  }
}