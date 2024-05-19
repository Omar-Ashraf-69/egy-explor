import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BarcodePaidRow extends StatelessWidget {
  const BarcodePaidRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          FontAwesomeIcons.barcode,
          weight: 50,
          size: 50,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xFF32A84F), width: 1.5),
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Text(
            "PAID",
            style: Styles.textStyle24.copyWith(color: const Color(0xFF32A84F)),
          ),
        ),
      ],
    );
  }
}
