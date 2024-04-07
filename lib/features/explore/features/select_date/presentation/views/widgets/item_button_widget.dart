import 'package:egy_exlpor/core/constants/color_palatte.dart';
import 'package:egy_exlpor/core/constants/dimension_constants.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ItemButtonWidget extends StatelessWidget {
  const ItemButtonWidget({Key? key, required this.data, this.onTap, this.color})
      : super(key: key);

  final String data;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
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
              ? Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                )
              : Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                ),
        ),
      ),
    );
  }
}
