import 'package:egy_exlpor/features/extra_services/weather/data/models/weather_model.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/managers/weather_cubit/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DayItem extends StatelessWidget {
  const DayItem({super.key, required this.day, required this.ind});

  final DayWeatherModel day;
  final int ind;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<WeatherCubit>(context).changeHomeScreenState(ind);
      },
      child: Container(
        margin: const EdgeInsets.only(
          right: 8,
        ),
        height: 80,
        width: 60,
        decoration: BoxDecoration(
          border: Border(
            right: const BorderSide(color: Colors.grey, width: 0.5),
            left: const BorderSide(color: Colors.grey, width: 0.5),
            top: const BorderSide(color: Colors.grey, width: 0.5),
            bottom: BorderSide(
              color: ind == BlocProvider.of<WeatherCubit>(context).index
                  ? Colors.blue // Color for selected item
                  : Colors.grey, // Transparent color when not selected
              width: ind == BlocProvider.of<WeatherCubit>(context).index
                  ? 3
                  : 0.5, // Adjust the width of the underline
            ),
          ),
        ),
        child: Column(
          children: [
            Text(
              DateTime.now().day == day.date.day
                  ? 'Today'
                  : DateFormat('E').format(day.date),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Image.network(
              day.imageUrl,
              height: 28,
              width: 28,
            ),
            Text(
              '${day.maxTemp.round()}°/${day.minTemp.round()}°',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
