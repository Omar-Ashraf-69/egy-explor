import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
    this.color,
    this.size,
    this.location,
  });
  final double? size;
  final Color? color;
  final String? location;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          IconlyLight.location,
          size: size ?? 20,
          color: color,
        ),
        const SizedBox(width: 5),
        Text(
          location?.split(',').first ?? "French Polynesia",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
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
