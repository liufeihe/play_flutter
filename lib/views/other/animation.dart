//reference : https://www.jianshu.com/p/5f9ac5e5157f
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_lottie/flutter_lottie.dart';
import 'package:play_flutter/constant/color.dart';


class JsonAnimation extends StatelessWidget{
  LottieController _animationCtl;

  void animationViewCreated(LottieController controller){
    _animationCtl = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FlutterI18n.translate(context, 'animation.title')),
      ),
      body: Center(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 32,
                height: 32,
                color: ColorStyle.bgBlue,
                child: LottieView.fromFile(
                  filePath: 'assets/animations/radar.json',
                  onViewCreated: animationViewCreated,
                  autoPlay: false,
                  loop: true,
                ),
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                    child: Text(FlutterI18n.translate(context, 'button.play')),
                    onPressed: (){
                      _animationCtl.play();
                    },
                  ),
                  FlatButton(
                    child: Text(FlutterI18n.translate(context, 'button.stop')),
                    onPressed: (){
                      _animationCtl.stop();
                    },
                  ),
                  FlatButton(
                    child: Text(FlutterI18n.translate(context, 'button.pause')),
                    onPressed: (){
                      _animationCtl.pause();
                    },
                  ),
                  FlatButton(
                    child: Text(FlutterI18n.translate(context, 'button.resume')),
                    onPressed: (){
                      _animationCtl.resume();
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