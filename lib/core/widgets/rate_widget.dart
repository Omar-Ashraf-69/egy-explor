import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({
    super.key,
    this.showRateCount = false,
    this.color,
    this.rate,
  });
  final bool showRateCount;
  final Color? color;
  final String? rate;
  @override
  Widget build(BuildContext context) {
    String rating = rate == '0.0' || rate == null ? "4.1" : rate!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow.shade700,
          size: 20,
        ),
        Text(
          rating,
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        if (showRateCount)
          const Text(
            "(331)",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
      ],
    );
  }
}
