import 'package:egy_exlpor/core/managers/app_them_cubit/app_them_cubit.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesIcon extends StatelessWidget {
  const FavoritesIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BlocProvider.of<ThemeCubit>(context).getIsDarkTheme
            ? kSeconderyBlueColor.withOpacity(0.07)
            : kSeconderyBlueColor.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
      width: 30,
      height: 30,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {},
        child: Icon(
          Icons.favorite,
          size: 20,
          color: kPrimaryRedColor,
        ),
      ),
    );
  }
}
