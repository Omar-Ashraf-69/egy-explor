import 'package:egy_exlpor/core/constants/dimension_constants.dart';
import 'package:egy_exlpor/core/utils/image_helper.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';
class ItemOptionsBookingWidget extends StatelessWidget {
  const ItemOptionsBookingWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String value;
  final String icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kTopPadding),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(bottom: kMediumPadding),
        child: Row(
          children: [
            ImageHelper.loadFromAsset(
              icon,
            ),
            SizedBox(
              width: kDefaultPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Styles.textStyle18,
                ),
                SizedBox(
                  height: kMinPadding,
                ),
                Text(
                  value,
                  style:Styles.textStyle18,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
