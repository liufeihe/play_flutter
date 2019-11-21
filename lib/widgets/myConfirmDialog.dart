import 'package:play_flutter/constant/color.dart';
import 'package:play_flutter/widgets/myOutlineButton.dart';
import 'package:flutter/material.dart';

class MyConfirmDialogContent extends StatefulWidget{
  final Function tapCallback;
  final String msg;
  final String okBtnText;
  final String cancelBtnText;
  final double width;

  MyConfirmDialogContent({
    @required this.msg,
    @required this.tapCallback,
    this.okBtnText: '确认',
    this.cancelBtnText: '取消',
    this.width: 270,
  });

  @override
  State<StatefulWidget> createState() {
    return _MyConfirmDialogContentState();
  }
}

class _MyConfirmDialogContentState extends State<MyConfirmDialogContent> {
  String msg;
  Function tapCallback;
  String okBtnText;
  String cancelBtnText;
  double width;
  
  @override
  void initState() {
    super.initState();
    msg = widget.msg;
    tapCallback = widget.tapCallback;
    okBtnText = widget.okBtnText;
    cancelBtnText = widget.cancelBtnText;
    width = widget.width;
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      constrainedAxis: Axis.horizontal,
      child: SizedBox(
        width: width,
        child: AlertDialog(
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(32, 28, 32, 21),
          titlePadding: EdgeInsets.zero,
          content: Container(
            width: width,
            // height: 224,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                
                Container(
                  width: width-32*2,
                  padding: EdgeInsets.only(bottom: 28),
                  child: Text(
                    '$msg',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorStyle.textBlack,
                      fontSize: 18,
                    ),
                  ),
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 9),
                      child: MyOutlineButton(
                        text: '$cancelBtnText',
                        textSize: 16,
                        width: 103,
                        height: 38,
                        textColor: ColorStyle.bgDark,
                        bgColors: [ColorStyle.bgGrey,ColorStyle.bgGrey],
                        tapCallback: (){
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 9),
                      child: MyOutlineButton(
                        text: '$okBtnText',
                        textSize: 16,
                        width: 103,
                        height: 38,
                        textColor: Colors.white,
                        bgColors: [ColorStyle.bgBlue,ColorStyle.bgBlue],
                        tapCallback: (){
                          Navigator.of(context).pop();
                          tapCallback();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}