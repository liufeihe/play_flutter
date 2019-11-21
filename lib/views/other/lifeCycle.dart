import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:play_flutter/utils/log.dart';

const String _module = 'lifeCycle';

class LifeCycle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LifeCycleState();
  }
}

class _LifeCycleState extends State<LifeCycle> with WidgetsBindingObserver {
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
    WidgetsBinding.instance.addObserver(this);
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
    WidgetsBinding.instance.removeObserver(this);
    LogUtils.printStr(LogLevel.Debug, _module, 'dispose');
  }

  @override
  void reassemble() {
    super.reassemble();
    LogUtils.printStr(LogLevel.Debug, _module, 'reassemble');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    LogUtils.printStr(LogLevel.Debug, _module, 'state is $state');
  }

  @override
  Widget build(BuildContext context) {
    LogUtils.printStr(LogLevel.Debug, _module, 'build');
    return Scaffold(
      appBar: AppBar(
        title: Text(FlutterI18n.translate(context, 'lifeCycle.title')),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(FlutterI18n.plural(context, 'lifeCycle.clickTimes', _count)),
            FlatButton(
              child: Text('go lifeCycle2'),
              onPressed: (){
                Navigator.pushNamed(context, '/lifeCycle2');
              },
            )
          ],
        ),
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