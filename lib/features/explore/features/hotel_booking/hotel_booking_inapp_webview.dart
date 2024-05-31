import 'package:egy_exlpor/core/widgets/inapp_webview.dart';
import 'package:flutter/material.dart';

class HotelBookingInappWebview extends StatelessWidget {
  const HotelBookingInappWebview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CustomInAppWebView(url: 'https://m.booking.com'));
    // body: CustomInAppWebView(url: 'https://m.hotels.com'));
    // body: CustomInAppWebView(url: 'https://www.expedia.com/Hotels'));
  }
}
