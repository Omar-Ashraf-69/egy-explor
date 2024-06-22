import 'package:egy_exlpor/core/managers/speech_cubit/speech_cubit.dart';
import 'package:egy_exlpor/features/search/data/models/recommended_places/recommended_places.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchRecommendationsResultView extends StatelessWidget {
  const SearchRecommendationsResultView({super.key, required this.places});
  final List<RecommendedPlaces> places;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpeechCubit()..initialize(),
      child: Scaffold(
        body: SearchRecommendationsResultViewBody(
          places: places,
        ),
      ),
    );
  }
}
