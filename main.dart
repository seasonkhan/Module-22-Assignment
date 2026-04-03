import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const YouTubeLiteApp());
}

class YouTubeLiteApp extends StatelessWidget {
  const YouTubeLiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YouTube Lite',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const YouTubeWebView(),
    );
  }
}

class YouTubeWebView extends StatefulWidget {
  const YouTubeWebView({super.key});

  @override
  State<YouTubeWebView> createState() => _YouTubeWebViewState();
}

class _YouTubeWebViewState extends State<YouTubeWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    
    // WebViewController initialization
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar if needed
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse('https://www.youtube.com'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Lite'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
