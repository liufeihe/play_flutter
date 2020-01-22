import 'package:flutter/material.dart';
import 'package:play_flutter/constant/color.dart';

void voidFuncCall() {}
const List<Color> colors = [ColorStyle.bgBlue, ColorStyle.bgBlue];
const EdgeInsets marginDefault = EdgeInsets.fromLTRB(0, 0, 0, 0);

class MyOutlineButton extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight textWeight;
  final Color textColor;
  final List<Color> bgColors;
  final double borderRadius;
  final double height;
  final double width;
  final Function tapCallback;
  final EdgeInsets margin;
  
  MyOutlineButton({
    this.text,
    this.textSize = 12,
    this.textWeight = FontWeight.normal,
    this.textColor = Colors.white,
    this.bgColors = colors,
    this.borderRadius = 22,
    this.height = 30,
    this.width = 100,
    this.tapCallback = voidFuncCall,
    this.margin = marginDefault,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: bgColors,
        ),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: FlatButton(
        // borderSide: BorderSide(color: Colors.white, width: 0),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        child: Text(
          '$text',
          style: TextStyle(
            color: textColor,
            fontSize: textSize,
            fontWeight: textWeight,
          ),
        ),
        onPressed: (){
          tapCallback();
        },
      ),
    );
  }
}