import 'package:egy_exlpor/features/extra_services/weather/presentation/managers/weather_cubit/weather_cubit.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/managers/weather_cubit/weather_states.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/views/widgets/filter_hourly_data.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/views/widgets/hour_weather_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HourListContainer extends StatelessWidget {
  const HourListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) => SizedBox(
        height: 115,
        width: double.infinity,
        child: HourList(
          hoursModel: filterHourlyData(BlocProvider.of<WeatherCubit>(context)
              .weatherModel!
              .days[BlocProvider.of<WeatherCubit>(context).index]
              .hours),
        ),
      ),
    );
  }
}
