import 'package:egy_exlpor/features/extra_services/weather/presentation/managers/weather_cubit/weather_cubit.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/managers/weather_cubit/weather_states.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/views/widgets/day_list_container.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/views/widgets/hour_list_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverViewWidget extends StatelessWidget {
  const OverViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Divider(
            indent: 2,
            endIndent: 2,
            thickness: 1,
          ),
          SizedBox(
            height: 10,
          ),
          HourListContainer(),
          SizedBox(
            height: 25,
          ),
          DayListContainer(),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
