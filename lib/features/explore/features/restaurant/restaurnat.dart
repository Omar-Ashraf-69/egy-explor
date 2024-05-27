import 'package:egy_exlpor/core/widgets/inapp_webview.dart';
import 'package:flutter/material.dart';

class RestaurnatView extends StatelessWidget {
  const RestaurnatView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
          CustomInAppWebView(url: 'https://www.talabat.com/egypt/restaurants'),
    );
  }
}
