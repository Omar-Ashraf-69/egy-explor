import 'package:egy_exlpor/features/extra_services/weather/presentation/views/widgets/weather_view_body.dart';
import 'package:flutter/material.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  static const String routeName = '/weather_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WeatherViewBody(),
    );
  }
}
