import 'package:flutter/material.dart';

class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.sizeOf(context).height * 0.2 + 20,
      left: 24,
      right: 24,
      child: Row(
        children: List.generate(
          28,
          (index) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Container(
                decoration: ShapeDecoration(
                  color: const Color(0xffb8b8b8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
                height: 3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
