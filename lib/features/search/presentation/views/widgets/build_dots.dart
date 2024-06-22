import 'package:flutter/material.dart';

Container buildDot(int currentIndex, int index, BuildContext context) {
  return Container(
    height: 10,
    width: currentIndex == index ? 25 : 10,
    margin: const EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: currentIndex == index ? Colors.blue : Colors.grey,
    ),
  );
}
