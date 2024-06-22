import 'package:egy_exlpor/features/favorites/presentation/views/widgets/favorites_icon.dart';
import 'package:egy_exlpor/features/home/presentation/views/widgets/love_icon_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class SpotImage extends StatelessWidget {
  const SpotImage({
    super.key,
    this.isFavoritesView = false,
    this.height = 140,
    this.index = 3,
    this.notHomeScreen = true,
    required this.imageUrl,
  });
  final bool isFavoritesView;
  final double height;
  final int index;
  final bool notHomeScreen;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: FancyShimmerImage(
            imageUrl: imageUrl,
            width: double.infinity,
            height: height,
            boxFit: BoxFit.cover,
            shimmerBackColor: Colors.grey.shade300,
          ),
          // child: Image.network(
          //   imageUrl,
          //   width: double.maxFinite,
          //   fit: BoxFit.cover,
          //   height: height,
          // ),
        ),
        if (notHomeScreen)
          isFavoritesView
              ? const Positioned(
                  top: 7,
                  right: 7,
                  child: FavoritesIcon(),
                )
              : const Positioned(
                  top: 7,
                  right: 7,
                  child: LoveIconWidget(),
                ),
      ],
    );
  }
}
