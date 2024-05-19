import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TotalPriceRowWidget extends StatelessWidget {
  const TotalPriceRowWidget({
    super.key,
    required this.amount,
  });
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Total',
          style: Styles.textStyle24,
        ),
        Text(
          '\$$amount',
          style: Styles.textStyle24,
        ),
      ],
    );
  }
}
