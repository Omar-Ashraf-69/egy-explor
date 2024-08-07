import 'package:egy_exlpor/generated/l10n.dart';
import 'package:flutter/material.dart';

AppBar chatCustomAppBar(context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0),
        child: Icon(
          Icons.arrow_back_sharp,
        ),
      ),
    ),
    centerTitle: true,
    title: Text(
      S.of(context).ideaMate,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: "Cera Pro",
        fontSize: 25,
      ),
    ),
  );
}
