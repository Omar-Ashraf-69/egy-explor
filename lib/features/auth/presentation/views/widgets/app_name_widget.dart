

import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "06",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          "16",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}