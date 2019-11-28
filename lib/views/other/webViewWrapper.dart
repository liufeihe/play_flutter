import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fzxing/fzxing.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWrapper extends StatefulWidget {
  @override
  _WebViewWrapperState createState() => _WebViewWrapperState();
}

class _WebViewWrapperState extends State<WebViewWrapper> {
  List<String> _barcode;
  int count = 0;
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  void _callCamera(){
    try {
      Fzxing
          .scan(isBeep: true, isContinuous: false)
          .then((barcodeResult) {
            print("flutter size:" + barcodeResult?.toString());
            _setMsg(barcodeResult[0]);
            // setState(() {
            //   _barcode = barcodeResult;
            // });
          });
    } on PlatformException {
      _barcode.add('Failed to get barcode.');
    }
  }

  void _setMsg(msg){
    _controller.future.then((contoller){
      contoller.evaluateJavascript('vue.setMsg("$msg")').then((result) {
          // You can handle JS result here.
      });
    });
    count++;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Plugin example app'),
        // ),
        body: WebView(
          initialUrl: 'http://192.168.3.205:8080',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController){
            _controller.complete(webViewController);
          },
          navigationDelegate: (NavigationRequest request){
            String url = request.url;
            String querys;
            String call;
            if (url.startsWith('js://lebai')) {
              querys = url.split('?')[1];
              call = querys.split('call=')[1];
              call = call.split('&')[0];
              if (call == 'camera') {
                _callCamera();
                // showDialog(
                //   context: context,
                //   builder: (context)=>SimpleDialog(
                //     title: Text('call camera'),
                //     children: <Widget>[
                //       SimpleDialogOption(
                //         child: Text('OK'),
                //         onPressed: () {
                //           Navigator.of(context).pop();
                //         },
                //       ),
                //       SimpleDialogOption(
                //         child: Text('CANCEL'),
                //         onPressed: () {
                //           Navigator.of(context).pop();
                //         },
                //       )
                //     ],
                //   ),
                // );
              }
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            _setMsg(count);
          },
          child: Text('setMsg'),
        ),
        
        
        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       Text('barcode: $_barcode\n'),
        //       RaisedButton(
        //         onPressed: () {
        //           try {
        //             Fzxing
        //                 .scan(isBeep: true, isContinuous: true)
        //                 .then((barcodeResult) {
        //               print("flutter size:" + barcodeResult?.toString());
        //               setState(() {
        //                 _barcode = barcodeResult;
        //               });
        //             });
        //           } on PlatformException {
        //             _barcode.add('Failed to get barcode.');
        //           }
        //         },
        //         child: Text('scan'),
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}