import 'package:egy_exlpor/core/managers/app_them_cubit/app_them_cubit.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

class LoveIconWidget extends StatefulWidget {
  const LoveIconWidget({
    super.key,
  });

  @override
  State<LoveIconWidget> createState() => _LoveIconWidgetState();
}

class _LoveIconWidgetState extends State<LoveIconWidget> {
  bool? clicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BlocProvider.of<ThemeCubit>(context).getIsDarkTheme
            ? kSeconderyBlueColor.withOpacity(0.07)
            : kSeconderyBlueColor.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
      width: 35,
      height: 35,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          clicked = !clicked!;
          setState(() {});
        },
        child: Icon(
          clicked! ? Icons.favorite : Ionicons.heart_outline,
          color: clicked! ? kPrimaryRedColor : kPrimaryColor,
        ),
      ),
    );
  }
}
