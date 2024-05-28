import 'package:egy_exlpor/features/extra_services/weather/data/models/weather_model.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/managers/weather_cubit/weather_cubit.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/views/widgets/hour_weather_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HourList extends StatelessWidget {
  const HourList({super.key, required this.hoursModel});

  final List<HourWeatherModel> hoursModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: BlocProvider.of<WeatherCubit>(context).scrollController,
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      itemCount: hoursModel.length,
      itemBuilder: (context, index) => HourItem(hour: hoursModel[index]),
    );
  }
}
