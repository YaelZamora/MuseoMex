import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  WebViewPage({
    Key? key,
    required this.sitio,
    required this.museo,
  }) : super(key: key);

  final String sitio;
  final String museo;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff71F3FC),
        title: Text(widget.museo),
      ),
      body: WebView(
        initialUrl: widget.sitio,
      ),
    );
  }
}
