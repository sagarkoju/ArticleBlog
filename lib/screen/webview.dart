import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView in Flutter'),
        centerTitle: true,
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://flutterguide.com/',
        onWebViewCreated: (controller) {
          controller = controller;
        },
      ),
    );
  }
}
