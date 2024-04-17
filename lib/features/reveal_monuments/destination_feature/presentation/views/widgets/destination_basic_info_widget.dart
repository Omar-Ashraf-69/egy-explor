import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/reveal_monuments/destination_feature/presentation/views/widgets/destination_rate_and_price_row.dart';
import 'package:egy_exlpor/features/reveal_monuments/destination_feature/presentation/views/widgets/details_section_divider.dart';
import 'package:flutter/material.dart';

class DestinationBasicInfoWidget extends StatelessWidget {
  const DestinationBasicInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DetailsSectionDividerWidget(),
        const SizedBox(height: 12),
        const Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            "Dahab",
            style: Styles.textStyle30,
          ),
        ),
        const SizedBox(height: 7),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            "South Sinai, Egypt",
            style: Styles.textStyle14.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
            // style: .text.bodyMedium,
          ),
        ),
        const SizedBox(height: 24),
        const DestinationRateAndPriceRow(),
      ],
    );
  }
}
