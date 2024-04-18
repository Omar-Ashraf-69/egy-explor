
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Text(
            "About",
            style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.w600,
            ),
            // style: CustomTextStyles.titleMediumSemiBold16,
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: SizedBox(
            width: double.infinity,
            child: ReadMoreText(
              "You_will_gels. In the southwest ncludes the Laguna area, famous for its excellent shallow-water kite- and windsurfing.ahab can be divided into three major parts. Masbat, which includsurfing. ",
              trimLines: 2,
              colorClickableText: kPrimaryColor,
              trimMode: TrimMode.Line,
              trimCollapsedText: " Read More",
              moreStyle: Styles.textStyle14.copyWith(
                color: kPrimaryColor,
              ),
              lessStyle: Styles.textStyle14.copyWith(
                color: kPrimaryBlueColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
