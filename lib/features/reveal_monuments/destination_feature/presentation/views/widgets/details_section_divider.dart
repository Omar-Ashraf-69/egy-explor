
import 'package:flutter/material.dart';

class DetailsSectionDividerWidget extends StatelessWidget {
  const DetailsSectionDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 5,
          width: 36,
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade400.withOpacity(0.42),
            borderRadius: BorderRadius.circular(
              2,
            ),
          ),
        ),
      ),
    );
  }
}
