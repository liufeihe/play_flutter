import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';
import 'package:play_flutter/utils/translate.dart';
import 'package:udp/udp.dart';

class Udp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UdpState();
  }
}

class _UdpState extends State<Udp> {

  void _startUdp() async {
    var multicastEndpoint = Endpoint.multicast(InternetAddress("224.0.0.251"), port: Port(5353));
  
    var receiver = await UDP.bind(multicastEndpoint);
  
    var sender = await UDP.bind(Endpoint.any());
    
    var count = 0;
  
    unawaited(receiver.listen((datagram) {
      if (datagram != null) {
        var str = String.fromCharCodes(datagram?.data);
        count++;
        print('$count, $str');
        print(datagram.address);
  
        stdout.write(str);
      }
    }));

    var data = {
      'QNAME': "_lebai._tcp.",
      "QTYPE": 16,
      "UNICAST-RESPONSE": 1,
      "QCLASS": 1,
    };
    String dataStr = json.encode(data);
    // String dataStr = 'foo';
    print(dataStr.codeUnits);
  
    await sender.send(dataStr.codeUnits, multicastEndpoint);
  
    await Future.delayed(Duration(seconds:5));
  
    sender.close();
    receiver.close();
  }

  @override
  void initState() {
    super.initState();
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