import 'package:egy_exlpor/features/extra_services/weather/data/models/weather_model.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/managers/weather_cubit/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TodayInfoContanier extends StatelessWidget {
  const TodayInfoContanier(
      {super.key, required this.weather, required this.index});
  final WeatherModel weather;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateTime.now().day ==
                        weather
                            .days[BlocProvider.of<WeatherCubit>(context).index]
                            .date
                            .day
                    ? 'Now'
                    : DateFormat('E').format(weather
                        .days[BlocProvider.of<WeatherCubit>(context).index]
                        .date),
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    index == 0
                        ? '${weather.days[index].hours[DateTime.now().hour].temp.round()}°'
                        : '${weather.days[index].temp.round()}°',
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  // Remember to replace the asset with Network🤓
                  Image.network(
                    index == 0
                        ? weather
                            .days[index].hours[DateTime.now().hour].imageUrl
                        : weather.days[index].imageUrl,
                    cacheHeight: 60,
                    cacheWidth: 60,
                  ),
                ],
              ),
              Text(
                index == 0
                    ? 'Feels like ${weather.days[index].hours[DateTime.now().hour - 1].feelsLike.round()}°'
                    : 'Feels like ${weather.days[index].feelsLike.round()}°',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Text(
                    '⬆️ ${weather.days[index].maxTemp.round()}°',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '⬇️ ${weather.days[index].minTemp.round()}°',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Spacer(
                flex: 1,
              ),
              Text(
                weather.days[index].condition,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Humidity: ${weather.days[index].humidity}",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Text(
                "Wind: ${weather.days[index].wind.round()} km/m",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
