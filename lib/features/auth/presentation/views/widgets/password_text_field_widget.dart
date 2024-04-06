import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordTextField extends StatelessWidget {
  PasswordTextField({
    super.key,
    required this.label,
    required this.controller,
    this.onSuffixTap,
    this.isPass = true,
  });
  final TextEditingController controller;
  final void Function()? onSuffixTap;
  final String label;
  bool isPass;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) {},
      obscureText: isPass,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Password can't be empty.";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.password_outlined,
        ),
        suffixIcon: InkWell(
          onTap: onSuffixTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: isPass
                ? const Icon(
                    Icons.remove_red_eye_outlined,
                  )
                : const Icon(Icons.remove_red_eye_rounded),
          ),
        ),
        label: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        fillColor: kWhiteColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(16),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
