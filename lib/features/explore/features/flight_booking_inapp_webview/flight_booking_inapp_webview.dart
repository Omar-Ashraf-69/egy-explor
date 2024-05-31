import 'package:egy_exlpor/core/widgets/inapp_webview.dart';
import 'package:flutter/material.dart';

class FlightBookingInappWebview extends StatelessWidget {
  const FlightBookingInappWebview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CustomInAppWebView(url: 'https://www.skyscanner.com'));
    // body: CustomInAppWebView(url: 'https://m.kayak.com/flights'));
    // body: CustomInAppWebView(
    //     url: 'https://www.google.com/flights?mode=mobile'));
  }
}
