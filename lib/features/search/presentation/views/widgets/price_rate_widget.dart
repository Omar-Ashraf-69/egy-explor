import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "\$472/",
        style: Styles.textStyle14.copyWith(
          color: kPrimaryColor,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
        ),
        children: [
          TextSpan(
            text: " Person",
            style: Styles.textStyle14.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
          ),
        ],
      ),
    );
  }
}
