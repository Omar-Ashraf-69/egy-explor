import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';

class RoomTitleWidget extends StatelessWidget {
  const RoomTitleWidget({super.key, required this.roomTitle});
  final String roomTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            roomTitle,
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 13),
        ],
      ),
    );
  }
}
