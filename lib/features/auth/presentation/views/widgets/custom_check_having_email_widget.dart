import 'package:egy_exlpor/core/managers/app_them_cubit/app_them_cubit.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCheckHavingEmailWidget extends StatelessWidget {
  const CustomCheckHavingEmailWidget({
    super.key,
    required this.checkingMessage,
    required this.actionMessage,
    this.onTap,
  });
  final String checkingMessage;
  final String actionMessage;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: checkingMessage,
        style: Styles.textStyle14.copyWith(
          color: BlocProvider.of<ThemeCubit>(context).getIsDarkTheme
              ? kPinkColor
              : kBlackColor,
        ),
        children: [
          TextSpan(
            text: actionMessage,
            style: const TextStyle(
              fontSize: 16,
              color: kPrimaryColor,
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
