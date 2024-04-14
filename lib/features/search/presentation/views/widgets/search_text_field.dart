import 'package:egy_exlpor/core/managers/app_them_cubit/app_them_cubit.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.hintText,
  });
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(),
      keyboardType: TextInputType.text,
      onChanged: (value) {},
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Ionicons.search_outline,
        ),
        hintText: hintText,
        hintStyle: Styles.textStyle14.copyWith(
          fontWeight: FontWeight.w800,
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 40,
              child: VerticalDivider(),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Ionicons.mic_outline,
                  color: Colors.grey.shade600,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(16),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        fillColor: !BlocProvider.of<ThemeCubit>(context).getIsDarkTheme
            ? kWhiteColor
            : null,
      ),
    );
  }
}
