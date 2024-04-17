import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class AboutDestinationPart extends StatelessWidget {
  const AboutDestinationPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            "About Destination",
            style: Styles.textStyle24.copyWith(),
          ),
        ),
        const SizedBox(height: 7),
        SizedBox(
          width: double.infinity,
          child: ReadMoreText(
            "You_will_get_a_comjor parts. Masbat, which includes the Bedouin village of Asalah, is in the north. South of Masbat is Mashraba, which is more touristic and has considerably more hotels. In the southwest is Medina which includes the Laguna area, famous for its excellent shallow-water kite- and windsurfing.!!!!! into three major parts. Masbat, which includes the Bedouin village of Asalah, is in the north. South of Masbat is Mashraba, which is more touristic and has considerably more hotels. In the southwest is Medina which includes the Laguna area, famous for its excellent shallow-water kite- and windsurfing.ahab can be divided into three major parts. Masbat, which includsurfing. ",
            trimLines: 5,
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
      ],
    );
  }
}
