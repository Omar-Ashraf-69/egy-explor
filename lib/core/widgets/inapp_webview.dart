import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomInAppWebView extends StatefulWidget {
  const CustomInAppWebView({super.key, required this.url});
  final String url;

  @override
  _UberWebViewState createState() => _UberWebViewState();
}

class _UberWebViewState extends State<CustomInAppWebView> {
  InAppWebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(
              widget.url,
            ),
          ),
          onWebViewCreated: (controller) {
            _webViewController = controller;
            _loadCookies(); // Load saved cookies when WebView is created
          },
          onLoadStop: (controller, url) {
            _saveCookies(); // Save cookies after each page load
          },
        ),
      ),
    );
  }

  Future<void> _loadCookies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cookies = prefs.getString('uber_cookies');
    if (cookies != null && _webViewController != null) {
      _webViewController!.evaluateJavascript(
        source: "document.cookie = '$cookies';",
      );
    }
  }

  Future<void> _saveCookies() async {
    if (_webViewController != null) {
      String? cookies = await _webViewController!.evaluateJavascript(
        source: "document.cookie;",
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('uber_cookies', cookies ?? '');
    }
  }
}
