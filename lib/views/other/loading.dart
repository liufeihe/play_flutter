import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
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

  void _submit() {

    setState(() {
      _isLoading = true;
    });

    //Simulate a service call
    print('submitting to backend...');
    new Future.delayed(new Duration(seconds: 4), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
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