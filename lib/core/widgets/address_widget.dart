import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
    this.color,
    this.size,
  });
  final double? size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          IconlyLight.location,
          size: size ?? 20,
          color: color,
        ),
        SizedBox(width: 5),
        Text(
          "French Polynesia",
          style: TextStyle(
            fontSize: size ?? 12,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ],
    );
  }
}
