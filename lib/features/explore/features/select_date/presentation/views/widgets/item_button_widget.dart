import 'package:egy_exlpor/core/constants/color_palatte.dart';
import 'package:egy_exlpor/core/constants/dimension_constants.dart';
import 'package:egy_exlpor/core/constants/textstyle_ext.dart';
import 'package:flutter/material.dart';

class ItemButtonWidget extends StatelessWidget {
  const ItemButtonWidget({super.key, required this.data, this.onTap, this.color});

  final String data;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:const EdgeInsets.symmetric(vertical: kDefaultPadding),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kMediumPadding),
          gradient: Gradients.defaultGradientBackground,
        ),
        alignment: Alignment.center,
        child: Text(
          data,
          style: color == null
              ? TextStyles.defaultStyle.whiteTextColor.bold
              : TextStyles.defaultStyle.bold.copyWith(
                  color: ColorPalette.primaryColor,
                ),
        ),
      ),
    );
  }
}
