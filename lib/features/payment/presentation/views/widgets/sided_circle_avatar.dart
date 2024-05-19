import 'package:flutter/material.dart';

class SidedCircleAvatar extends StatelessWidget {
  const SidedCircleAvatar({
    super.key,
    required this.isRightCircle,
  });
  final bool isRightCircle;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.sizeOf(context).height * 0.20,
      left: isRightCircle ? null : -20,
      right: isRightCircle ? -20 : null,
      child: const CircleAvatar(
        backgroundColor: Colors.white,
      ),
    );
  }
}
