import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/reveal_monuments/destination_feature/presentation/views/widgets/details_section_divider.dart';
import 'package:flutter/material.dart';

class DestinationBasicInfoWidget extends StatelessWidget {
  const DestinationBasicInfoWidget({super.key, this.title, this.location});
  final String? title;
  final String? location;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DetailsSectionDividerWidget(),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            title ?? "",
            style: Styles.textStyle30,
          ),
        ),
        const SizedBox(height: 7),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            location ?? "",
            style: Styles.textStyle14.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
            // style: .text.bodyMedium,
          ),
        ),
        // const SizedBox(height: 24),
        // const DestinationRateAndPriceRow(),
      ],
    );
  }
}
