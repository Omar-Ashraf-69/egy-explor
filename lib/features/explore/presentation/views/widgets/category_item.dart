
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
    required this.iconImage,
  });
  final String title;
  final String iconImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14.0),
      child: Container(
        width: 75,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                iconImage,
                color: kPrimaryBlueColor,
                height: 40,
                width: 45,
              ),
              Text(
                title,
                style: Styles.textStyle12.copyWith(
                  fontWeight: FontWeight.w600,
                  color: kGreyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
