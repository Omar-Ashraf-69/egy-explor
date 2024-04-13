import 'package:egy_exlpor/core/managers/app_them_cubit/app_them_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    this.route,
    this.pop,
  });
  final Widget icon;
  final String? route;
  final bool? pop;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 45,
      child: Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: BlocProvider.of<ThemeCubit>(context).getIsDarkTheme
              ? Colors.grey.shade900
              : Colors.grey.shade200,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () {
            route != null ? Navigator.of(context).pushNamed(route!) : null;
            pop == true ? Navigator.pop(context) : null;
          },
          constraints: const BoxConstraints.tightFor(width: 20, height: 20),
          icon: icon,
          splashRadius: 20,
          padding: EdgeInsets.zero,
          iconSize: 20,
        ),
      ),
    );
  }
}
