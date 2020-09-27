class ServiceResult{
  String name;
  String ip;
  int port;
  String wiredIp;
  String wiredMac;
  String wirelessIp;
  String wirelessMac;
  bool isOnline;//设备是否在线
  String tag;

  ServiceResult({
    this.name: '',
    this.ip: '',
    this.port: 80,
    this.wirelessIp, 
    this.wirelessMac, 
    this.wiredIp, 
    this.wiredMac,
    this.isOnline: false,
    this.tag: '',
  });

  factory ServiceResult.fromJson(Map<String, dynamic>json) {
    return ServiceResult(
      name: json['name'],
      ip: json['ip'],
      port: json['port'],
      wirelessIp: json['wirelessIp'],
      wirelessMac: json['wirelessMac'],
      wiredIp: json['wiredIp'],
      wiredMac: json['wiredMac'],
      isOnline: json['isOnline']=='true',
      tag: json['tag'],
    );
  }
  
  Map<String, dynamic> toJson()=>
    <String, dynamic>{
      'name': name,
      'ip': ip,
      'port': port,
      'wirelessIp': wirelessIp,
      'wirelessMac': wirelessMac,
      'wiredIp': wiredIp,
      'wiredMac': wiredMac,
      'isOnline': isOnline,
      'tag': tag,
    };

  ServiceResult copyWith(ServiceResult dev){
    return ServiceResult(
      name: dev.name ?? this.name,
      ip: dev.ip ?? this.ip,
      port: dev.port ?? this.port, 
      wirelessIp: dev.wirelessIp ?? this.wirelessIp, 
      wirelessMac: dev.wirelessMac ?? this.wirelessMac, 
      wiredIp: dev.wiredIp ?? this.wiredIp, 
      wiredMac: dev.wiredMac ?? this.wiredMac, 
      isOnline: dev.isOnline ?? this.isOnline,
      tag: dev.tag ?? this.tag,
    );
  }

  String toString()=>
    'dev result, tag: $tag, name: $name, wiredMac:$wiredMac, ip:$ip, wiredIp: $wiredIp, wirelessIp: $wirelessIp, port: $port, online: $isOnline';
}