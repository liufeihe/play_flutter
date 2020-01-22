import 'package:flutter/material.dart';
import 'package:play_flutter/utils/translate.dart';
import 'package:play_flutter/views/feature/inheritSon.dart';
import 'package:play_flutter/views/feature/shareData.dart';
import 'package:play_flutter/widgets/myOutlineButton.dart';

class InheritRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InheritState();
  }
}

class _InheritState extends State<InheritRoute> {
  int count=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslateHandler.text(context, 'home.inherit.title'),
        ),
      ),
      body: Center(
        child: ShareDataWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: InheritSon(),
              ),
              MyOutlineButton(
                text: TranslateHandler.text(context, 'button.increment'),
                showBoxShadow: true,
                tapCallback: (){
                  if (mounted) {
                    setState(() {
                      count++;
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}