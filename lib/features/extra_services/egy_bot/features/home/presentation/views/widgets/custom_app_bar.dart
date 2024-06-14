import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(context) {
  return AppBar(
    clipBehavior: Clip.none,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    shadowColor: Colors.transparent,
    centerTitle: true,
    title: Image.asset(
      AssetsData.egyBotIcon,
      height: MediaQuery.sizeOf(context).height * 0.045,
    ),
  );
}
