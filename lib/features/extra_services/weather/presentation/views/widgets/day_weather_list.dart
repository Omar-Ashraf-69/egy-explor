import 'package:egy_exlpor/features/extra_services/weather/data/models/weather_model.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/views/widgets/day_weather_item.dart';
import 'package:flutter/material.dart';

class DayList extends StatelessWidget {
  const DayList({super.key, required this.daysModel});
  final List<DayWeatherModel> daysModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: daysModel.length,
      itemBuilder: (context, index) =>
          DayItem(day: daysModel[index], ind: index),
    );
  }
}
