import 'package:flutter/material.dart';
import 'package:play_flutter/utils/log.dart';
import 'package:play_flutter/widgets/myConfirmDialog.dart';

const String _module = 'lifeCycle2';

class LifeCycle2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LifeCycleState2();
  }
}

class _LifeCycleState2 extends State<LifeCycle2> {
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
  void didUpdateWidget(LifeCycle2 oldWidget) {
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
        title: Text('life cycle2'),
      ),
      body: Center(
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
              child: Text('back to home with confirm'),
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (context){
                    return MyConfirmDialogContent(
                      msg: '确认回到首页么？',
                      tapCallback: () async {
                        Navigator.pushNamedAndRemoveUntil(context, '/', (router)=>false);
                      },
                    );
                  }
                );
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