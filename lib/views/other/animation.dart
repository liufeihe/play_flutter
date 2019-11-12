//reference : https://www.jianshu.com/p/5f9ac5e5157f
import 'package:flutter/material.dart';
import 'package:flutter_lottie/flutter_lottie.dart';

class JsonAnimation extends StatelessWidget{
  LottieController _animationCtl;

  void animationViewCreated(LottieController controller){
    _animationCtl = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('json动画'),
      ),
      body: Center(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                color: Colors.white,
                child: LottieView.fromFile(
                  filePath: 'assets/animations/radar.json',
                  onViewCreated: animationViewCreated,
                  autoPlay: true,
                  loop: true,
                ),
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                    child: Text('暂停'),
                    onPressed: (){
                      _animationCtl.pause();
                    },
                  ),
                  FlatButton(
                    child: Text('重启'),
                    onPressed: (){
                      _animationCtl.resume();
                    },
                  ),
                  FlatButton(
                    child: Text('停止'),
                    onPressed: (){
                      _animationCtl.stop();
                    },
                  ),
                  FlatButton(
                    child: Text('开始'),
                    onPressed: (){
                      _animationCtl.play();
                    },
                  ),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}