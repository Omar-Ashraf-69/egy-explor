import 'dart:developer';

import 'package:egy_exlpor/features/extra_services/weather/data/models/weather_model.dart';
import 'package:egy_exlpor/features/extra_services/weather/data/weather_services.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/managers/weather_cubit/weather_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherModel? weatherModel;
  final ScrollController scrollController = ScrollController();

  String errorMessage = '';
  int index = 0;
  WeatherCubit() : super(InitialWeatherState());
  getWeatherCubit([String cityName = 'cairo']) async {
    emit(LoadingWeatherState());
    try {
      weatherModel = await WeatherService().getWeather(cityName: cityName);
      index = 0;
      emit(SuccessWeatherState());
    } catch (e) {
      emit(ErrorWeatherState(errorMessage: e.toString()));
      log(e.toString());
      errorMessage = e.toString();
    }
  }

  changeHomeScreenState(indx) {
    index = indx;

    scrollController.jumpTo(0.0);

    emit(ChangingWeatherState());
  }
}
