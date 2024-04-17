import 'package:egy_exlpor/core/utils/custom_image_view.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';

class RoomDetailsRowWidget extends StatelessWidget {
  const RoomDetailsRowWidget({
    super.key,
    required this.imagePath,
    this.price,
    required this.rowText,
    this.isPriceRow = false,
  });

  final String imagePath;
  final String? price;
  final String rowText;
  final bool? isPriceRow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomImageView(
            imagePath: imagePath,
            height: 24,
            width: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
            child: Text(rowText, style: Styles.textStyle14),
          ),
          const Spacer(),
          if (price != null)
            Text(
              price!,
              style: !isPriceRow!
                  ? Styles.textStyle14
                  : Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
            )
        ],
      ),
    );
  }
}
