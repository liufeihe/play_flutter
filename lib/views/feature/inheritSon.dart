import 'package:flutter/material.dart';
import 'package:play_flutter/views/feature/shareData.dart';

class InheritSon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InheritSonState();
  }
}

class _InheritSonState extends State<InheritSon> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('inheritSon, didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Inherit son data'),
        Text(
          ShareDataWidget.of(context).data.toString(),
        )
      ],
    );
  }
}