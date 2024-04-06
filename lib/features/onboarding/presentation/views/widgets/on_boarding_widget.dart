import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.suffixText,
  });
  final String title;
  final String suffixText;
  final String subTitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius:
              BorderRadius.circular(26), // Set your desired border radius
          child: Image.asset(
            image,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.42,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: title,
              style: Styles.textStyle30.copyWith(
                color: kPrimarytextColor,
              ),
              children: [
                TextSpan(
                  text: suffixText,
                  style: const TextStyle(
                    fontSize: 33,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            subTitle,
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
