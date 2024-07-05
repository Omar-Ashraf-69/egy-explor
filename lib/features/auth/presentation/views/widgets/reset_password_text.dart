import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/auth/presentation/views/reset_password_view.dart';
import 'package:flutter/material.dart';

class ResetPasswordTextWidget extends StatelessWidget {
  const ResetPasswordTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResetPasswordView()));
              },
              child: Text(
                "Forgot password?",
                style: Styles.textStyle16.copyWith(color: kPrimaryColor),
              )),
        ],
      ),
    );
  }
}
