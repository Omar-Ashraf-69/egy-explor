
import 'package:egy_exlpor/core/widgets/custom_back_arrow.dart';
import 'package:egy_exlpor/core/widgets/images_swiper.dart';
import 'package:flutter/material.dart';

class CustomViewPlaceImagesSection extends StatelessWidget {
  const CustomViewPlaceImagesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          ImagesSwiper(),
          const CustomBackArrowWidget(),
        ],
      ),
    );
  }
}
