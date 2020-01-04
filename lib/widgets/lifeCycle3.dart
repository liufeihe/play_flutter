import 'package:flutter/material.dart';
import 'package:play_flutter/utils/log.dart';

const String _module = 'lifeCycle3';

class LifeCycle3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LifeCycleState3();
  }
}

class _LifeCycleState3 extends State<LifeCycle3> {
  int _count = 0;

  void _addCount(){
    _count++;
    if (mounted) {
      setState(() {
        _count = _count;
      });
    }
  }

  @override
  void initState() {
    super.initState();
     LogUtils.printStr(LogLevel.Debug, _module, 'initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
     LogUtils.printStr(LogLevel.Debug, _module, 'didChangeDependencies');
  }

  @override
  void didUpdateWidget(LifeCycle3 oldWidget) {
    super.didUpdateWidget(oldWidget);
    LogUtils.printStr(LogLevel.Debug, _module, 'didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    LogUtils.printStr(LogLevel.Debug, _module, 'deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    LogUtils.printStr(LogLevel.Debug, _module, 'dispose');
  }

  @override
  void reassemble() {
    super.reassemble();
    LogUtils.printStr(LogLevel.Debug, _module, 'reassemble');
  }

  @override
  Widget build(BuildContext context) {
    LogUtils.printStr(LogLevel.Debug, _module, 'build');
    return Center(
      child: Column(
        children: <Widget>[
          Text('count: $_count'),
          FlatButton(
            child: Text('back to home'),
            onPressed: (){
              Navigator.pushNamedAndRemoveUntil(context, '/', (router)=>false);
            },
          ),
          FlatButton(
            child: Text('add'),
            onPressed: (){
              _addCount();
            },
          )
        ],
      ),
    );
  }
}