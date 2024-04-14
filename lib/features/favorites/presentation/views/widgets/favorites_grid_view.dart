import 'package:egy_exlpor/features/favorites/presentation/views/widgets/favorites_card_item.dart';
import 'package:flutter/material.dart';

class FavoritesGridView extends StatelessWidget {
  const FavoritesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (context, index) => const FavoritesCardItem(),
      ),
    );
  }
}
