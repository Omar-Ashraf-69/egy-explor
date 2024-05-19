import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';

class DetailsRowWidget extends StatelessWidget {
  const DetailsRowWidget(
      {super.key,
      required this.label,
      required this.details,
      this.labelStyle,
      this.detailsStyle});
  final String label, details;
  final TextStyle? labelStyle, detailsStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: labelStyle ?? Styles.textStyle18,
        ),
        Text(
          details,
          style: detailsStyle ?? Styles.textStyle18,
        ),
      ],
    );
  }
}
