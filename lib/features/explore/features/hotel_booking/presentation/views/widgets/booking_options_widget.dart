import 'package:egy_exlpor/core/utils/spaces.dart';
import 'package:egy_exlpor/core/utils/image_helper.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookingOptionsWidget extends StatelessWidget {
  const BookingOptionsWidget({
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
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
        ),
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            ImageHelper.loadFromAsset(
              icon,
            ),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Styles.textStyle18.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  value,
                  style: Styles.textStyle14.copyWith(color: Colors.black),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
