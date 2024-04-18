
import 'package:egy_exlpor/core/managers/app_them_cubit/app_them_cubit.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomViewContainer extends StatelessWidget {
  const CustomViewContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: !BlocProvider.of<ThemeCubit>(context).getIsDarkTheme
            ? kWhiteColor
            : null,
      ),
      child: SingleChildScrollView(
        child: child,
      ),
    );
  }
}
