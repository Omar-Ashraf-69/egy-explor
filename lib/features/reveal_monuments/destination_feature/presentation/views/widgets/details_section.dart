import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/custom_button_widget.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/reveal_monuments/destination_feature/presentation/views/widgets/about_destination_part.dart';
import 'package:egy_exlpor/features/reveal_monuments/destination_feature/presentation/views/widgets/destination_basic_info_widget.dart';
import 'package:flutter/material.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(22),
          ),
          color: kWhiteColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DestinationBasicInfoWidget(),
              const SizedBox(height: 14),
              const AboutDestinationPart(),
              const SizedBox(height: 14),
              CustomButtonWidget(
                label: Text(
                  "Book Now",
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
      ),
    );
  }
}
