import 'package:egy_exlpor/core/widgets/custom_view_place_images.dart';
import 'package:egy_exlpor/features/spot/presentation/views/widgets/place_details_section.dart';
import 'package:flutter/material.dart';


class SpotViewBody extends StatelessWidget {
  const SpotViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomViewPlaceImagesSection(),
            PlaceDetailsSection(),
          ],
        ),
      ),
    );
  }
}
