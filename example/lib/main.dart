import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter_x5/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Webview demp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title = ''});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late FocusNode _focusNode;
  ChooseFileMode chooseFileMode = ChooseFileMode.auto;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                WebviewFlutterX5.initX5(
                    needPermissionCallback: (List<String> permissions) async {
                  List<Permission> permissionList = [];
                  for (final item in permissions) {
                    if (item == 'camera') {
                      permissionList.add(Permission.camera);
                    } else if (item == 'storage') {
                      permissionList.add(Permission.storage);
                    }
                  }
                  if (permissionList.isNotEmpty) {
                    Map<Permission, PermissionStatus> statuses =
                        await permissionList.request();
                    print('dart?????????: $permissions $statuses');
                  }
                });
              },
              child: Container(
                width: 100.0,
                height: 45.0,
                color: Colors.blue[200],
                alignment: Alignment.center,
                child: Text(
                  'X5?????????',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text('X5??????????????????'),
                    ),
                    body: SafeArea(
                        child: WebviewPage(
                            'http://soft.imtt.qq.com/browser/tes/feedback.html')),
                  );
                }));
              },
              child: Container(
                width: 100.0,
                height: 45.0,
                margin: EdgeInsets.only(top: 20),
                color: Colors.blue[200],
                alignment: Alignment.center,
                child: Text(
                  'X5??????????????????',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text('x5??????????????????'),
                    ),
                    body:
                        SafeArea(child: WebviewPage('http://debugtbs.qq.com/')),
                  );
                }));
              },
              child: Container(
                width: 100.0,
                height: 45.0,
                margin: EdgeInsets.only(top: 20),
                color: Colors.blue[200],
                alignment: Alignment.center,
                child: Text(
                  'x5??????????????????',
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (_focusNode.hasFocus) {
                  _focusNode.unfocus();
                }
                String url2 = 'https://www.baidu.com/';
                await Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text('??????'),
                    ),
                    body: SafeArea(child: WebviewPage(url2)),
                  );
                }));
              },
              child: Container(
                width: 100.0,
                height: 45.0,
                margin: EdgeInsets.only(top: 20),
                color: Colors.blue[200],
                alignment: Alignment.center,
                child: Text(
                  '??????',
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (_focusNode.hasFocus) {
                  _focusNode.unfocus();
                }
                String url2 = 'https://www.baidu.com/';
                // await Navigator.push(context, MaterialPageRoute(builder: (_) {
                //   return Scaffold(
                //     appBar: AppBar(
                //       title: Text('??????webview??????'),
                //     ),
                //     body: SafeArea(
                //         child: OriginWebview.WebView(
                //       initialUrl: url2,
                //     )),
                //   );
                // }));
              },
              child: Container(
                width: 100.0,
                height: 45.0,
                margin: EdgeInsets.only(top: 20),
                color: Colors.blue[200],
                alignment: Alignment.center,
                child: Text(
                  '??????webview??????',
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await WebviewFlutterX5.canGetDeviceId(false);
              },
              child: Container(
                width: 100.0,
                height: 45.0,
                margin: EdgeInsets.only(top: 20),
                color: Colors.blue[200],
                alignment: Alignment.center,
                child: Text(
                  '????????????imei',
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await WebviewFlutterX5.canGetSubscriberId(false);
              },
              child: Container(
                width: 100.0,
                height: 45.0,
                margin: EdgeInsets.only(top: 20),
                color: Colors.blue[200],
                alignment: Alignment.center,
                child: Text(
                  '????????????IMSI',
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await WebviewFlutterX5.canGetAndroidId(false);
              },
              child: Container(
                width: 100.0,
                height: 45.0,
                margin: EdgeInsets.only(top: 20),
                color: Colors.blue[200],
                alignment: Alignment.center,
                child: Text(
                  '????????????AndroidID',
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await WebviewFlutterX5.manualPhoneModel();
              },
              child: Container(
                width: 100.0,
                height: 45.0,
                margin: EdgeInsets.only(top: 20),
                color: Colors.blue[200],
                alignment: Alignment.center,
                child: Text(
                  '??????????????????',
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await WebviewFlutterX5.manualPhoneSerial();
              },
              child: Container(
                width: 100.0,
                height: 45.0,
                margin: EdgeInsets.only(top: 20),
                color: Colors.blue[200],
                alignment: Alignment.center,
                child: Text(
                  '??????SN',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200.0,
                  height: 45.0,
                  margin: EdgeInsets.only(top: 20),
                  color: Colors.blue[200],
                  alignment: Alignment.center,
                  child: Text(
                    '?????????????????? $chooseFileMode',
                  ),
                ),
                PopupMenuButton<ChooseFileMode>(
                    icon: Icon(
                      Icons.add,
                      size: 24,
                      color: Colors.grey,
                    ),
                    padding: EdgeInsets.zero,
                    onSelected: (value) async {
                      setState(() {
                        chooseFileMode = value;
                      });
                      await WebviewFlutterX5.setChooseFileMode(value);
                    },
                    itemBuilder: (BuildContext context) => getWidgets()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<PopupMenuEntry<ChooseFileMode>> getWidgets() {
    List<ChooseFileMode> strategyList = ChooseFileMode.values;
    List<PopupMenuEntry<ChooseFileMode>> widgets = [];
    for (int i = 0; i < strategyList.length; i++) {
      var ele = strategyList[i];
      widgets.add(PopupMenuItem<ChooseFileMode>(
          value: ele,
          child: Container(
            // color: Colors.green,
            width: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '$ele',
                  style: TextStyle(fontSize: 14.0),
                ),
                if (ele == chooseFileMode)
                  Icon(
                    Icons.favorite,
                    size: 16.0,
                    color: Colors.blue,
                  )
                else
                  Container(),
              ],
            ),
          )));
      widgets.add(const PopupMenuDivider());
    }
    return widgets;
  }
}

class WebviewPage extends StatefulWidget {
  WebviewPage(this.url);

  final String url;

  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          initialUrl: widget.url,
          onWebViewCreated: _completer.complete,
          javascriptMode: JavascriptMode.unrestricted,
          onPageStarted: (url) {
            print('web view page test: start url:$url');
          },
          onPageFinished: (url) {
            print('web view page test: finish url:$url');
            setState(() {
              loading = false;
            });
          },
          navigationDelegate: (request) {
            print('web view page test: url:${widget.url}');
            // if (request.url.startsWith('http://')) {
            //   request.url.replaceFirst('http://', 'https://');
            // }
            print('web view page test: url:${widget.url}');
            return NavigationDecision.navigate;
          },
        ),
        loading ? Center(child: CircularProgressIndicator()) : Container(),
      ],
    );
  }
}
