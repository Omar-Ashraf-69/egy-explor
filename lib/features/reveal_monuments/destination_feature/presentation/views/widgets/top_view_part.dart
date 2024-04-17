
import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/core/utils/custom_image_view.dart';
import 'package:egy_exlpor/features/reveal_monuments/destination_feature/presentation/views/widgets/custom_row_back_arrow.dart';
import 'package:flutter/material.dart';

class TopViewPart extends StatelessWidget {
  const TopViewPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Stack(
        children: [
          CustomImageView(
            imagePath: AssetsData.imgRectangle818,
            width: double.infinity,
          ),
          const CustomRowBackArrow(),
        ],
      ),
    );
  }
}
