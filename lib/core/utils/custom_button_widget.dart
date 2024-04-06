import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.label,
    this.onTap,
    this.buttonColor,
  });
  final Widget label;
  final void Function()? onTap;
  final Color? buttonColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: buttonColor ?? kPrimaryColor,
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Center(
          child: label,
        ),
      ),
    );
  }
}
