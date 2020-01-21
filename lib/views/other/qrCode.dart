import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fzxing/fzxing.dart';

class QrCode extends StatefulWidget {
  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  List<String> _barcode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('barcode: $_barcode\n'),
              RaisedButton(
                onPressed: () {
                  try {
                    Fzxing
                        .scan(isBeep: true, isContinuous: false)
                        .then((barcodeResult) {
                      print("flutter size:" + barcodeResult?.toString());
                      setState(() {
                        _barcode = barcodeResult;
                      });
                    });
                  } on PlatformException {
                    _barcode.add('Failed to get barcode.');
                  }
                },
                child: Text('scan'),
              )
            ],
          ),
        ),
      ),
    );
  }
}