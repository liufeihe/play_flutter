import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multicast_dns/multicast_dns.dart';
import 'package:play_flutter/utils/mdns.dart';
import 'package:play_flutter/utils/translate.dart';

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
    MDNS.startMDNS('_lebai._tcp.');
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
    timer = Timer.periodic(Duration(seconds: 10), (timer) async {
      _checkMdnsClient();
    });
  }

  void _checkMdnsClient() async {
    const String name = '_lebai._tcp.local';
    final bool verbose = true;//args.contains('--verbose') || args.contains('-v');
    services = Set<String>();
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
          services.add('${srv.target}:${srv.port}, ${ip.address.address}');
          print(services.length);
          print(services);
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
    setState(() {
      services = services;
    });
  }

  List<Widget> _getWidgets(){
    List<Widget> widgets = [];
    widgets.add(Text('${services.length}'));
    for(var service in services){
      widgets.add(Text(
        service,
      ));
    }
    return widgets;
  }

  @override
  void initState() {
    super.initState();
    // _startMdns();
    _startMDNSClient();
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