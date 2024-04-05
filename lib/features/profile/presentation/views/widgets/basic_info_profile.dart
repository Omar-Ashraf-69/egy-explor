import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BasicInfoProfile extends StatelessWidget {
  const BasicInfoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage(
            "assets/images/man_icon.png",
          ),
          height: 130,
          width: 130,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Omar Ahmed",
          style: Styles.textStyle18,
        ),
        Text(
          "OmarAhmed@gmail.com",
          style: Styles.textStyle16.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
