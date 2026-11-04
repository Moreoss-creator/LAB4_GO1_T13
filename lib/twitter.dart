import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'theme.dart';
import 'widgets.dart';

class Twitter extends StatefulWidget {
  const Twitter({super.key});

  @override
  State<Twitter> createState() => _TwitterState();
}

class _TwitterState extends State<Twitter> {
  late final WebViewController controller;
  int _progress = 0;

  @override
  void initState() {
    super.initState();
    // Initialize the WebViewController and open the login page
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            if (!mounted) return;
            setState(() {
              _progress = progress;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse('https://x.com/i/flow/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ItaliaAppBar(currentRoute: '3'),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (_progress < 100)
            LinearProgressIndicator(
              value: _progress / 100,
              minHeight: 3.0,
              color: AppColors.green,
              backgroundColor: AppColors.surface,
            ),
        ],
      ),
    );
  }
}
