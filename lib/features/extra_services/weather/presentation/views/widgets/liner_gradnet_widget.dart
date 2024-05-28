import 'package:flutter/material.dart';

class LinerGradentWidget extends StatelessWidget {
  const LinerGradentWidget({
    super.key,
    required this.child,
    required this.condition,
  });
  final Widget child;
  final String condition;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getWeatherColor(condition)[900]!,
            getWeatherColor(condition)[500]!,
            getWeatherColor(condition)[400]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }

  MaterialColor getWeatherColor(String? condition) {
    if (condition == null) {
      return Colors.purple;
    }
    switch (condition) {
      case 'Sunny':
        return Colors.purple;
      case 'Partly cloudy':
      case 'Cloudy':
      case 'Overcast':
      case 'Mist':
        return Colors.blueGrey;
      case 'Patchy rain possible':
      case 'Patchy sleet possible':
      case 'Patchy freezing drizzle possible':
      case 'Patchy light rain':
      case 'Moderate rain at times':
      case 'Moderate rain':
      case 'Heavy rain at times':
      case 'Heavy rain':
      case 'Light freezing rain':
      case 'Moderate or heavy freezing rain':
      case 'Light sleet':
      case 'Moderate or heavy sleet':
      case 'Patchy light snow':
      case 'Light snow':
      case 'Patchy moderate snow':
      case 'Moderate snow':
      case 'Patchy heavy snow':
      case 'Heavy snow':
      case 'Ice pellets':
      case 'Light rain shower':
      case 'Moderate or heavy rain shower':
      case 'Torrential rain shower':
      case 'Light sleet showers':
      case 'Moderate or heavy sleet showers':
      case 'Light snow showers':
      case 'Moderate or heavy snow showers':
      case 'Light showers of ice pellets':
      case 'Moderate or heavy showers of ice pellets':
        return Colors.red;
      case 'Thundery outbreaks possible':
      case 'Patchy light rain with thunder':
      case 'Moderate or heavy rain with thunder':
      case 'Patchy light snow with thunder':
      case 'Moderate or heavy snow with thunder':
        return Colors.deepPurple;
      case 'Blowing snow':
      case 'Blizzard':
        return Colors.purple;
      case 'Fog':
      case 'Freezing fog':
        return Colors.blueGrey;
      default:
        return Colors.purple;
    }
  }
}
