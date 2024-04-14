import 'package:egy_exlpor/core/utils/custom_icon_button.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/recommendation_grid_view.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

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
            'Best Recommendations',
            style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTextField(
                hintText: 'Search for recommendations',
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Best for you',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(height: 15),
              RecommendationGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
