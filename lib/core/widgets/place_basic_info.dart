import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class PlaceBasicInfoWidget extends StatelessWidget {
  const PlaceBasicInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Zeyton Beach",
                    style: Styles.textStyle24,
                  ),
                  Text(
                    "\$27",
                    style: Styles.textStyle26,
                    // style: theme.textThemeeadlineSmall,
                  )
                ],
              ),
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    IconlyLight.location,
                    color: Colors.grey,
                    size: 20,
                  ),
                  Text(
                    "Dahab, Egypt",
                    style: Styles.textStyle16.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0),
              child: RateWidget(
                showRateCount: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
