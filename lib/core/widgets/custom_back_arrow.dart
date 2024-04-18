
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CustomBackArrowWidget extends StatelessWidget {
  const CustomBackArrowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, top: 8, right: 10),
        child: CustomIconButton(
          icon: Icon(
            Icons.chevron_left_outlined,
            color: kWhiteColor,
          ),
          pop: true,
          color: Colors.grey.withOpacity(.33),
        ),
      ),
    );
  }
}
