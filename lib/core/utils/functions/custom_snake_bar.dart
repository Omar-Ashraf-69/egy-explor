import 'package:flutter/material.dart';

void CustomSnakeBar(context, String url) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Can not launch $url')),
  );
}
