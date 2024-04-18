import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/custom_button_widget.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/core/widgets/about_section.dart';
import 'package:egy_exlpor/core/widgets/custom_view_container.dart';
import 'package:egy_exlpor/core/widgets/facilities_section.dart';
import 'package:egy_exlpor/core/widgets/place_basic_info.dart';
import 'package:flutter/material.dart';

class PlaceDetailsSection extends StatelessWidget {
  const PlaceDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomViewContainer(
        child: Column(
          children: [
            const PlaceBasicInfoWidget(),
            const SizedBox(height: 12),
            const AboutSection(),
            const SizedBox(height: 12),
            const FacilitiesSection(),
            const SizedBox(height: 12),
            CustomButtonWidget(
              label: Text(
                "Book Now",
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.w600,
                  color: kWhiteColor,
                ),
              ),
              buttonColor: kPrimaryColor,
              // onTap: () => Navigator.pushNamed(
              //     context, SelectRoomView.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
