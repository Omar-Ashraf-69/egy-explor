import 'package:egy_exlpor/features/search/data/models/recommended_places/recommended_places.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchRecommendationsResultView extends StatelessWidget {
  const SearchRecommendationsResultView({super.key, required this.places});
  final List<RecommendedPlaces> places;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchRecommendationsResultViewBody(
        places: places,
      ),
    );
  }
}
