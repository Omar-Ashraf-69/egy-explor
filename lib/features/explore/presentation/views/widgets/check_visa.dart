import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/explore/features/visa_checher/visa_checker_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CheckVisaWidget extends StatelessWidget {
  const CheckVisaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const VisaCheckerView()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          color: kWhiteColor,
        ),
        width: double.infinity,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //ClipRRect(
            //   borderRadius: BorderRadius.circular(18),
            //   child: Image.asset(
            //     AssetsData.visaChecker,
            //   ),
            // ),
            const Icon(
              FontAwesomeIcons.passport,
              color: kPrimaryColor,
              size: 30,
            ),
            const SizedBox(width: 10),
            Text(
              "Check Visa",
              style: Styles.textStyle18.copyWith(color: kBlackColor),
            ),
          ],
        ),
      ),
    );
  }
}
