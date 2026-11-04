import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'theme.dart';
import 'widgets.dart';

class Facebook extends StatefulWidget {
  const Facebook({super.key});

  @override
  State<Facebook> createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {
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
      ..loadRequest(Uri.parse('https://www.facebook.com/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ItaliaAppBar(currentRoute: '4'),
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
