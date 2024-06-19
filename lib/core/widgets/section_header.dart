import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle = "View All",
    this.isViewAll = true,
  });
  final String title;
  final String subtitle;
  final bool isViewAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.textStyle20.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        if (isViewAll)
          GestureDetector(
            onTap: () {},
            child: Text(
              subtitle,
              style: Styles.textStyle16.copyWith(
                color: kPrimaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
      ],
    );
  }
}
