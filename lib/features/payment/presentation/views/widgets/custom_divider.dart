import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      endIndent: 12,
      indent: 12,
      height: 34,
      color: Colors.grey,
    );
  }
}
