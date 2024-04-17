import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({
    super.key,
    this.showRateCount = false,
  });
  final bool showRateCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow.shade700,
          size: 22,
        ),
        const Text(
          "4.4",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
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
