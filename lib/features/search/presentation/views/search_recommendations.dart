
import 'package:egy_exlpor/features/search/presentation/views/widgets/search_recommendations_view_body.dart';
import 'package:flutter/material.dart';

class SearchRecommendationsView extends StatelessWidget {
  const SearchRecommendationsView({super.key});
  static const String routeName = '/search_view';
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchRecommendationsViewBody(),
    );
  }

}
