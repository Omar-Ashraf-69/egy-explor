import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SelectRoomButton extends StatelessWidget {
  const SelectRoomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
            backgroundColor: MaterialStateProperty.all(kPrimaryColor),
          ),
          child: Text(
            "Select room",
            style: Styles.textStyle14.copyWith(
              color: kWhiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
