import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/payment/presentation/views/widgets/check_out_info_list.dart';
import 'package:egy_exlpor/features/payment/presentation/views/widgets/custom_divider.dart';
import 'package:egy_exlpor/features/payment/presentation/views/widgets/total_price_row.dart';
import 'package:flutter/material.dart';

class ThankYouAndCheckOutDetailsSection extends StatelessWidget {
  const ThankYouAndCheckOutDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Thank You!",
          style: Styles.textStyle24,
        ),
        Text(
          "Your transaction was successful",
          style: Styles.textStyle20,
        ),
        SizedBox(
          height: 32,
        ),
        CheckOutInfoList(),
        CustomDivider(),
        TotalPriceRowWidget(
          amount: '50.97',
        ),
      ],
    );
  }
}
