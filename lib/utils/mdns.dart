import 'dart:async';
import 'package:mdns_plugin/mdns_plugin.dart';
import 'package:play_flutter/utils/log.dart';

const String _module = 'mdns';

class Delegate implements MDNSPluginDelegate {

  void onDiscoveryStarted(){
    LogUtils.printStr(LogLevel.Debug, _module, 'ios discovery started');
  }
  void onDiscoveryStopped(){
    LogUtils.printStr(LogLevel.Debug, _module, 'discovery stopped');
  }
  bool onServiceFound(MDNSService service){
    MDNS.addServiceItem(service.name);
    LogUtils.printStr(LogLevel.Debug, _module, 'service found: $service');
    return true;
  }
  void onServiceResolved(MDNSService service){
    var txt = MDNSService.toUTF8String(service.txt['data']),
        name = service.name,
        port = service.port;
    LogUtils.printStr(LogLevel.Debug, _module, 'service resolved: service, $service');
    LogUtils.printStr(LogLevel.Info, _module, 'service resolved: hostName, ${service.hostName}');
    LogUtils.printStr(LogLevel.Info, _module, 'service resolved: name, $name');
    LogUtils.printStr(LogLevel.Info, _module, 'service resolved: port, $port');
    LogUtils.printStr(LogLevel.Info, _module, 'service resolved: txt, $txt');
    
    MDNS.addResultList(name);
  }
  void onServiceUpdated(MDNSService service){
    LogUtils.printStr(LogLevel.Debug, _module, 'service updated: $service');
  }
  void onServiceRemoved(MDNSService service){
    LogUtils.printStr(LogLevel.Debug, _module, 'service removed: $service');
  }
}

class MDNS {
  static MDNSPlugin mdnsClient;
  static List<String> mdnsResultList;
  static Map<String, int> mdnsResultMap;
  static Set<String> servicesSet;
  static bool _isOver = true;

  static Future<void> startMDNS(String name) async {
    if (mdnsClient!=null) {
      return;
    }
    mdnsClient = MDNSPlugin(Delegate());
    _isOver = false;
    LogUtils.printStr(LogLevel.Debug, _module, 'start mdns ...');
    mdnsResultList = [];
    mdnsResultMap = Map<String,int>();
    servicesSet = Set<String>();
    await mdnsClient.startDiscovery(name, enableUpdating: false);
  }
  static Future<void> stopMDNS() async {
    if (mdnsClient!=null) {
      await mdnsClient.stopDiscovery();
      LogUtils.printStr(LogLevel.Debug, _module, 'stopped mdns ...');
      mdnsClient = null;
      _isOver = true;
    }
  }
  static Future<void> reStartMDNS(String name, [force]) async {
    LogUtils.printStr(LogLevel.Debug, _module, 'len: ${mdnsResultList.length}, $force');
    if (mdnsResultList.length<1 || force==true) {
      await stopMDNS();
      await startMDNS(name);
    }
  }
  static List<String> getResultList(){
    LogUtils.printStr(LogLevel.Debug, _module, 'len: ${mdnsResultList.length}');
    List<String> list = [];
    for (int i=0; i<mdnsResultList.length; i++) {
      list.add(mdnsResultList[i]);
    }
    return list;
  }

  static void addServiceItem(name){
    servicesSet.add(name);
  }

  static addResultList(name){
    int idx = mdnsResultMap[name];
    if (idx==null) {
      mdnsResultMap[name] = mdnsResultList.length;
      mdnsResultList.add(name);
    } else {
      mdnsResultList[idx] = name;
    }
  }
  
}

