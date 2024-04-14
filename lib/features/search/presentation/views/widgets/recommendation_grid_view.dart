import 'package:egy_exlpor/features/search/presentation/views/widgets/recommendation_card_item.dart';
import 'package:flutter/material.dart';

class RecommendationGridView extends StatelessWidget {
  const RecommendationGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.72,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (context, index) => const RecommendationCardItem(),
      ),
    );
  }
}
