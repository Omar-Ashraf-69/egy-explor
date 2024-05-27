import 'package:egy_exlpor/core/widgets/inapp_webview.dart';
import 'package:flutter/material.dart';

class UberView extends StatelessWidget {
  const UberView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CustomInAppWebView(url: 'https://m.uber.com'));
  }
}
