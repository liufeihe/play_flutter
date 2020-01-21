import 'package:flutter/material.dart';
import 'package:play_flutter/utils/log.dart';
import 'package:play_flutter/utils/translate.dart';
import 'package:play_flutter/widgets/lifeCycle3.dart';

const String _module = 'lifeCycle';

class LifeCycle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LifeCycleState();
  }
}

class _LifeCycleState extends State<LifeCycle> with WidgetsBindingObserver {
  int _count = 0;
  bool _isShow = false;

  @override
  Future<bool> didPopRoute() {
    return super.didPopRoute();
  }

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
        title: Text(
          TranslateHandler.text(context, 'home.lifeCycle.title'),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              TranslateHandler.text(context, 'home.lifeCycle.clickTimes', {'times': _count.toString()}),
            ),
            Visibility(
              visible: _isShow,
              child: LifeCycle3(),
            ),
            FlatButton(
              child: Text('hideAndShow'),
              onPressed: (){
                if (mounted) {
                  setState(() {
                    _isShow = !_isShow;
                  });
                }
              },
            ),
            FlatButton(
              child: Text('go lifeCycle2'),
              onPressed: ()async{
                await Navigator.pushNamed(context, '/lifeCycle2');
                LogUtils.printStr(LogLevel.Debug, _module, 'hahahahah, lifeCycle2');
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