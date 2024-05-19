import 'package:egy_exlpor/features/payment/presentation/views/widgets/barcode_paid_row.dart';
import 'package:egy_exlpor/features/payment/presentation/views/widgets/card_info.dart';
import 'package:egy_exlpor/features/payment/presentation/views/widgets/thank_you_and_chec_out_details_section.dart';
import 'package:flutter/material.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      padding: const EdgeInsets.only(left: 22, right: 22, top: 32),
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          const ThankYouAndCheckOutDetailsSection(),
          const SizedBox(
            height: 30,
          ),
          const CardInfoWidget(),
          const Spacer(),
          const BarcodePaidRow(),
          SizedBox(
            height: ((MediaQuery.sizeOf(context).height * 0.2 + 20) / 2) - 25,
          ),
        ],
      ),
    );
  }
}
