import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/custom_button_widget.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/core/widgets/custom_view_container.dart';
import 'package:egy_exlpor/features/hotel/presentation/views/widgets/about_section.dart';
import 'package:egy_exlpor/features/hotel/presentation/views/widgets/facilities_section.dart';
import 'package:egy_exlpor/features/hotel/presentation/views/widgets/hotel_basic_info_widget.dart';
import 'package:flutter/material.dart';

class HotalDetailsSection extends StatelessWidget {
  const HotalDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomViewContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HotelBasicInfoWidget(),
            const SizedBox(height: 12),
            const AboutSection(),
            const SizedBox(height: 12),
            const FacilitiesSection(),
            const SizedBox(height: 12),
            CustomButtonWidget(
              label: Text(
                "Select Room",
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.w600,
                  color: kWhiteColor,
                ),
              ),
              buttonColor: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
