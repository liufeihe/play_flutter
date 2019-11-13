import 'package:flutter/material.dart';
import 'package:play_flutter/utils/log.dart';

const String _module = 'lifeCycle';

class LifeCycle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LifeCycleState();
  }
}

class _LifeCycleState extends State<LifeCycle> {
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
  void didUpdateWidget(LifeCycle oldWidget) {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('life cycle'),
      ),
      body: Center(
        child: Text('count: $_count'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _addCount();
        },
      ),
    );
  }
}