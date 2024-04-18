
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/core/widgets/facilites_widget.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class FacilitiesSection extends StatelessWidget {
  const FacilitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Text(
            "Facilities",
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.w600,
            ),
            // style: CustomTextStyles.titleMediumSemiBold16,
          ),
        ),
        const SizedBox(height: 10),
        const FacilitiesWidget(
          icon: Ionicons.wifi,
          text: 'Free Wifi',
        ),
        const SizedBox(height: 4),
        const FacilitiesWidget(
          icon: Icons.flood_outlined,
          text: 'Pool',
        ),
        const SizedBox(height: 4),
        const FacilitiesWidget(
          icon: Ionicons.fast_food_outline,
          text: 'Breakfast',
        ),
        const SizedBox(height: 4),
        const FacilitiesWidget(
          icon: Icons.breakfast_dining_outlined,
          text: 'Launch',
        ),
      ],
    );
  }
}
