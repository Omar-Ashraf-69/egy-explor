import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/payment/presentation/views/widgets/custom_details_row.dart';
import 'package:flutter/material.dart';

class CheckOutInfoList extends StatelessWidget {
  const CheckOutInfoList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailsRowWidget(
          label: 'Date',
          details: '11/05/2024',
          detailsStyle: Styles.textStyle18,
        ),
        SizedBox(
          height: 12,
        ),
        DetailsRowWidget(
          label: 'Time',
          details: '04:09 PM',
          detailsStyle: Styles.textStyle18,
        ),
        SizedBox(
          height: 12,
        ),
        DetailsRowWidget(
          label: 'To',
          details: 'Omar Ashraf',
          detailsStyle: Styles.textStyle18,
        ),
      ],
    );
  }
}
