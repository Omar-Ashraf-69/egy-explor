import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/rate_widget.dart';
import 'package:flutter/material.dart';

class PriceRateWidget extends StatelessWidget {
  const PriceRateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: "\$472/",
            style: Styles.textStyle16.copyWith(
              color: kPrimaryColor,
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
        ),
        const RateWidget(),
      ],
    );
  }
}
