
import 'package:egy_exlpor/features/search/data/constant/cons.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/build_dots.dart';
import 'package:flutter/material.dart';

class NavigationController extends StatelessWidget {
  const NavigationController(
      {super.key,
      this.onBackTap,
      this.onForwardTap,
      required this.currentIndex});
  final void Function()? onBackTap;
  final void Function()? onForwardTap;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: onBackTap,
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) => buildDot(currentIndex, index, context),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: onForwardTap,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue,
              child: selectedCities.isNotEmpty &&
                      selectedInterests.isNotEmpty &&
                      selectedActivities.isNotEmpty &&
                      selectedAge.isNotEmpty &&
                      currentIndex == 3
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
