import 'package:egy_exlpor/features/extra_services/weather/data/models/weather_model.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/managers/weather_cubit/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HourItem extends StatelessWidget {
  const HourItem({
    super.key,
    required this.hour,
  });
  final HourWeatherModel hour;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: SizedBox(
        height: 115,
        width: 60,
        child: Column(children: [
          Text(
            BlocProvider.of<WeatherCubit>(context)
                            .weatherModel!
                            .localTime
                            .hour ==
                        hour.time.hour &&
                    hour.time.day == DateTime.now().day
                ? 'Now'
                : DateFormat('j').format(hour.time),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          const Spacer(),
          Image.network(
            hour.imageUrl,
            height: 40,
            width: 40,
          ),
          Text(
            '${hour.temp.round()}°',
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ]),
      ),
    );
  }
}
