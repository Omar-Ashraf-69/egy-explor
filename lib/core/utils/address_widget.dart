
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Ionicons.location_outline,
          size: 20,
        ),
        SizedBox(width: 5),
        Text(
          "French Polynesia",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
