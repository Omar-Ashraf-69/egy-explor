// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:egy_exlpor/core/managers/app_them_cubit/app_them_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
  });
  final Widget icon;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BlocProvider.of<ThemeCubit>(context).getIsDarkTheme
            ? Colors.grey.shade900
            : Colors.grey.shade200,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {},
        constraints: const BoxConstraints.tightFor(width: 40),
        icon: icon,
        splashRadius: 22,
      ),
    );
  }
}
