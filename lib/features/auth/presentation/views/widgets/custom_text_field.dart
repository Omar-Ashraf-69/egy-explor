import 'package:egy_exlpor/core/managers/app_them_cubit/app_them_cubit.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.suffixIcon,
    required this.label,
    this.prefixIcon,
    required this.textEditingController,
    this.onChanged,
    this.hintText,
    this.isLabelSticked = false,
  });
  final TextEditingController textEditingController;
  final String label;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final void Function(String)? onChanged;
  final String? hintText;
  final bool isLabelSticked;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "$label can't be empty.";
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        floatingLabelBehavior: isLabelSticked
            ? FloatingLabelBehavior.always
            : FloatingLabelBehavior.auto,
        label: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        filled: true,
        fillColor: !BlocProvider.of<ThemeCubit>(context).getIsDarkTheme
            ? kWhiteColor
            : null,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(),
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
