import 'package:egy_exlpor/core/utils/custom_icon_button.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/search/data/models/recommended_places/recommended_places.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/recommendation_grid_view.dart';
import 'package:egy_exlpor/generated/l10n.dart';
import 'package:flutter/material.dart';

class SearchRecommendationsResultViewBody extends StatelessWidget {
  const SearchRecommendationsResultViewBody({super.key, required this.places});
  final List<RecommendedPlaces> places;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          leading: const Padding(
            padding: EdgeInsets.all(6),
            child: CustomIconButton(
              icon: Icon(Icons.chevron_left_outlined),
              pop: true,
            ),
          ),
          centerTitle: true,
          title: Text(
            S.of(context).bestRecommendations,
            style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SearchTextField(
              //   controller: TextEditingController(),
              //   hintText: 'Search for recommendations',
              // ),
              // const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  S.of(context).bestForYou,
                  style: Styles.textStyle18,
                ),
              ),
              const SizedBox(height: 15),
              RecommendationGridView(
                places: places,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
