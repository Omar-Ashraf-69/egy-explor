import 'package:egy_exlpor/features/extra_services/weather/presentation/managers/weather_cubit/weather_cubit.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/managers/weather_cubit/weather_states.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/views/widgets/day_weather_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DayListContainer extends StatelessWidget {
  const DayListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) => SizedBox(
        height: 80,
        width: double.infinity,
        child: DayList(
          daysModel: BlocProvider.of<WeatherCubit>(context).weatherModel!.days,
        ),
      ),
    );
  }
}
