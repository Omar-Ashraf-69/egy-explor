import 'package:egy_exlpor/features/extra_services/weather/presentation/managers/weather_cubit/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({super.key});
  String cityName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text(
          'Search a City',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: TextField(
            onChanged: (value) {
              cityName = value;
            },
            onSubmitted: (value) async {
              await BlocProvider.of<WeatherCubit>(context)
                  .getWeatherCubit(value);
              Navigator.pop(context);
            },
            keyboardType: TextInputType.name,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(24),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              border: const OutlineInputBorder(),
              hoverColor: Colors.amber,
              fillColor: Colors.amber,
              focusColor: Colors.amber,
              hintText: 'Enter city name',
              hintStyle: TextStyle(color: Colors.grey),
              labelText: 'Search',
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
              suffixIcon: GestureDetector(
                onTap: () async {
                  await BlocProvider.of<WeatherCubit>(context)
                      .getWeatherCubit(cityName);
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
