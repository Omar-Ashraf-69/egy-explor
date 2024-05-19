import 'package:egy_exlpor/core/utils/custom_icon_button.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar({required String title}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    leading: const Padding(
      padding: EdgeInsets.all(6),
      child: CustomIconButton(
        icon: Icon(Icons.chevron_left_outlined),
        pop: true,
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      style: Styles.textStyle20.copyWith(
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
