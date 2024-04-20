import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ServicesItemWidget extends StatelessWidget {
  const ServicesItemWidget({
    super.key,
    required this.iconImage,
    required this.title,
  });
  final String iconImage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14.0, bottom: 1.5),
      child: MaterialButton(
        elevation: 0.1,
        padding:const EdgeInsets.symmetric(horizontal: 10),
        onPressed: () {},
        color: kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              iconImage,
              height: 18,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}