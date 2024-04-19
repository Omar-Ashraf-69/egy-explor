import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/core/widgets/rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HotelBasicInfoWidget extends StatelessWidget {
  const HotelBasicInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Esha Hilton",
                style: Styles.textStyle24,
              ),
              Text(
                "\$85",
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
                "Cairo, Egypt",
                style: Styles.textStyle16.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),

                // style: CustomTextStyles.titleSmallGray500,
              ),
              const Spacer(),
              Text(
                "(for 1 Night/Room)",
                style: Styles.textStyle12.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
                // // style: CustomTextStyles.titleSmallOnError,
              )
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
    );
  }
}
