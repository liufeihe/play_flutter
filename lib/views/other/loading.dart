import 'dart:async';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:play_flutter/utils/translate.dart';
import 'package:play_flutter/widgets/myOutlineButton.dart';

class Loading extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingState();
  }
}

class _LoadingState extends State<Loading> {
  bool _isLoading = false;
  int countsLimit = 20;
  int count = 0;
  Timer countTimer;

  void _submit() {
    _setLoading(true);
    _startCount();
  }

  void _setLoading(loading) {
    if (mounted) {
      setState(() {
        _isLoading = loading;
      });
    }
  }

  void _setCount() {
    if (mounted) {
      setState(() {
        count = count;
      });
    }
  }

  void _startCount() {
    if (countTimer!=null) {
      _cancelCount();
    }
    count = 0;
    countTimer = Timer.periodic(Duration(seconds: 1), (timer){
      if (count>=countsLimit) {
        _cancelCount();
        _setLoading(false);
        return;
      }
      count++;
      _setCount();
    });
  }

  double _getPercent() {
    return count/countsLimit;
  }

  String _getPercentStr() {
    int per = count*100~/countsLimit;
    return per.toString()+'%';
  }

  void _cancelCount(){
    if (countTimer!=null) {
      countTimer.cancel();
      countTimer = null;
    }
  }

  @override
  void dispose() {
    _cancelCount();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      progressIndicator: CircularPercentIndicator(
        radius: 60,
        lineWidth: 4,
        percent: _getPercent(),
        center: Text(
          _getPercentStr(),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            TranslateHandler.text(context, 'other.loading.title'),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              MyOutlineButton(
                text: TranslateHandler.text(context, 'button.load'),
                tapCallback: (){
                  _submit();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}