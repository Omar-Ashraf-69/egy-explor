import 'package:flutter/material.dart';

void customSnakeBar(
    {required BuildContext context,
    required String message,
    TextStyle? style}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(
      message,
      style: style,
    )),
  );
}
