import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class XPage extends StatefulWidget {
  const XPage({super.key});

  @override
  State<XPage> createState() => _XPageState();
}

class _XPageState extends State<XPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://x.com'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('X (Twitter)')),
      body: WebViewWidget(controller: controller),
    );
  }
}
