import 'package:egy_exlpor/features/favorites/presentation/views/widgets/favorites_card_item.dart';
import 'package:egy_exlpor/features/home/data/models/top_places.dart';
import 'package:flutter/material.dart';

class FavoritesGridView extends StatelessWidget {
  const FavoritesGridView({
    super.key,
    required this.favorites,
  });
  final List<TopPlaces> favorites;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: favorites.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (context, index) => FavoritesCardItem(
          favorite: favorites[index],
        ),
      ),
    );
  }
}
