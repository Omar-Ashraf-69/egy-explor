import 'package:egy_exlpor/features/favorites/presentation/views/widgets/favorites_icon.dart';
import 'package:egy_exlpor/features/home/data/models/recommended_places_model.dart';
import 'package:egy_exlpor/features/home/presentation/views/widgets/love_icon_widget.dart';
import 'package:flutter/material.dart';

class SpotImage extends StatelessWidget {
  const SpotImage({
    super.key,
    this.isFavoritesView = false,
  });
  final bool isFavoritesView;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            recommendedPlaces[3].image,
            width: double.maxFinite,
            fit: BoxFit.cover,
            height: 140,
          ),
        ),
        isFavoritesView
            ?const Positioned(
                top: 7,
                right: 7,
                child: FavoritesIcon(),
              )
            : const Positioned(
                top: 5,
                right: 5,
                child: LoveIconWidget(),
              ),
      ],
    );
  }
}
