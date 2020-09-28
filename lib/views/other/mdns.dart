import 'dart:async';
import 'dart:io';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:play_flutter/multi_dns/multi_dns.dart';
// import 'package:play_flutter/utils/mdns.dart';
import 'package:play_flutter/utils/translate.dart';
// import 'package:udp/udp.dart';

class Mdns extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MdnsState();
  }
}

class _MdnsState extends State<Mdns> {

  MDnsClient client;
  Set<String> services = Set<String>();
  Timer timer;

  void _startMdns() {
    // MDNS.startMDNS('_lebai._tcp.');
  }

  void _startMDNSClient() async {
    // const String name = '_lebai._tcp.local';
    // final MDnsClient client = MDnsClient();
    // // Start the client with default options.
    // await client.start();

    // // Get the PTR recod for the service.
    // await for (PtrResourceRecord ptr in client
    //     .lookup<PtrResourceRecord>(ResourceRecordQuery.serverPointer(name))) {
    //   // Use the domainName from the PTR record to get the SRV record,
    //   // which will have the port and local hostname.
    //   // Note that duplicate messages may come through, especially if any
    //   // other mDNS queries are running elsewhere on the machine.
    //   await for (SrvResourceRecord srv in client.lookup<SrvResourceRecord>(
    //       ResourceRecordQuery.service(ptr.domainName))) {
    //     // Domain name will be something like "io.flutter.example@some-iphone.local._dartobservatory._tcp.local"
    //     final String bundleId = ptr.domainName; //.substring(0, ptr.domainName.indexOf('@'));
    //     print('Dart observatory instance found at '
    //         '${srv.target}:${srv.port} for "$bundleId".');
    //   }
    // }

    
    // final String name = args.last;
    client = MDnsClient();
    await client.start();
    _checkMdnsClient();
    timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      _checkMdnsClient();
    });
  }

  void _checkMdnsClient() async {
    const String name = '_lebai._tcp.local';
    final bool verbose = true;//args.contains('--verbose') || args.contains('-v');
    client.clear();
    // services = Set<String>();
    await for (PtrResourceRecord ptr in client
        .lookup<PtrResourceRecord>(ResourceRecordQuery.serverPointer(name))) {
      // if (verbose) {
      //   print(ptr);
      // }
      await for (SrvResourceRecord srv in client.lookup<SrvResourceRecord>(
          ResourceRecordQuery.service(ptr.domainName))) {
        // if (verbose) {
        //   print(srv);
        // }
        // if (verbose) {
        //   await client
        //       .lookup<TxtResourceRecord>(ResourceRecordQuery.text(ptr.domainName))
        //       .forEach(print);
        // }
        await for (IPAddressResourceRecord ip
            in client.lookup<IPAddressResourceRecord>(
                ResourceRecordQuery.addressIPv4(srv.target))) {
          // if (verbose) {
          //   print(ip);
          // }
          // print('Service instance found at '
          //     '${srv.target}:${srv.port} with ${ip.address}.');
          services.add('${srv.target}, ${ip.address.address}:${srv.port}');
        }
        // await for (IPAddressResourceRecord ip
        //     in client.lookup<IPAddressResourceRecord>(
        //         ResourceRecordQuery.addressIPv6(srv.target))) {
        //   if (verbose) {
        //     print(ip);
        //   }
        //   print('Service instance found at '
        //       '${srv.target}:${srv.port} with ${ip.address}.');
        // }
      }
    }
    print(services.length);
    print(services);
    setState(() {
      services = services;
    });
  }

  List<Widget> _getWidgets(){
    List<Widget> widgets = [];
    widgets.add(Text('${services.length}'));
    List<String> texts = [];
    for(var service in services){
      texts.add(service);
    }
    texts.sort();
    for(var text in texts){
      widgets.add(Text(
        text,
      ));
    }
    return widgets;
  }

  void _startUdpReceive(){
    // InternetAddress multicastAddress = new InternetAddress('239.10.10.100');
    int multicastPort = 4545;
    InternetAddress multicastAddress = new InternetAddress('224.0.0.251');
    // int multicastPort = 5353;

    RawDatagramSocket.bind(
      InternetAddress.anyIPv4, 
      multicastPort,
      reuseAddress: true,
      reusePort: true
    ).then((RawDatagramSocket s){
      print('Datagram socket ready to receive');
      print('${s.address.address}:${s.port}');
      s.joinMulticast(multicastAddress);
      print('multicast group joined');
      s.listen((RawSocketEvent event) {
        Datagram d = s.receive();
        if (d==null) return;
        String msg = new String.fromCharCodes(d.data).trim();
        print('Datagram from ${d.address.address}:${d.port}: ${msg}');
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // _startMdns();
    // _startMDNSClient();
    _startUdpReceive();
  }

  @override
  void dispose() {
    // MDNS.stopMDNS();
    super.dispose();
    if (client!=null) {
      client.stop();
    }
    if (timer !=null) {
      timer.cancel();
      timer = null;
    }
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _getWidgets()
        // <Widget>[
        //   FlatButton(onPressed: (){
        //     _startMDNSClient();
        //   }, child: Text('start mdns'))
        // ],
      ),
    );
  }
}