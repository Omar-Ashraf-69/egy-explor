
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/price_rate_widget.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class DestinationRateAndPriceRow extends StatelessWidget {
  const DestinationRateAndPriceRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(IconlyLight.location),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            "Dahab",
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.grey,
            ),
            // style: .text.bodyMedium,
          ),
        ),
        const Spacer(),
        const RateWidget(
          showRateCount: true,
        ),
        const Spacer(),
        const PriceWidget(),
      ],
    );
  }
}
