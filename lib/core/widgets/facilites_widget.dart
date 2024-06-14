import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';

class FacilitiesWidget extends StatelessWidget {
  const FacilitiesWidget({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: Styles.textStyle14,
            // style: CustomTextStyles.labelLargeOnError,
          )
        ],
      ),
    );
  }
}
