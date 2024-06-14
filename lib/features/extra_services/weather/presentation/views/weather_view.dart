import 'package:egy_exlpor/features/extra_services/weather/presentation/managers/weather_cubit/weather_cubit.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/managers/weather_cubit/weather_states.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/views/widgets/chance_of_rain_widget.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/views/widgets/liner_gradnet_widget.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/views/widgets/overview_widget.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/views/widgets/search_widget.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/views/widgets/sun_rise_set_widget.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/views/widgets/today_weather_info_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) {
        if (state is InitialWeatherState || state is LoadingWeatherState) {
          return const Scaffold(
            body: LinerGradentWidget(
                condition: 'Mist',
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.blueAccent,
                  ),
                )),
          );
        } else if (state is SuccessWeatherState ||
            state is ChangingWeatherState) {
          return Scaffold(
            body: LinerGradentWidget(
              condition: BlocProvider.of<WeatherCubit>(context)
                  .weatherModel!
                  .days[BlocProvider.of<WeatherCubit>(context).index]
                  .condition,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Ionicons.arrow_back,
                              color: Colors.white,
                            )),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              BlocProvider.of<WeatherCubit>(context)
                                  .weatherModel!
                                  .name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              DateFormat('E h:mm a').format(
                                  BlocProvider.of<WeatherCubit>(context)
                                      .weatherModel!
                                      .localTime),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchWidget(),
                                ),
                              );
                            }),
                      ],
                    ),
                    TodayInfoContanier(
                      weather:
                          BlocProvider.of<WeatherCubit>(context).weatherModel!,
                      index: BlocProvider.of<WeatherCubit>(context).index,
                    ),
                    const OverViewWidget(),
                    const SunRiseSetWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    const ChanceOfRain(),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Oops error ${BlocProvider.of<WeatherCubit>(context).errorMessage}",
                    style: const TextStyle(color: Colors.red, fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchWidget(),
                          ),
                        );
                      },
                      child: const Text(
                        "Try Again",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue,
                        ),
                      )),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
