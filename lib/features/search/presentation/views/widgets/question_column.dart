import 'package:egy_exlpor/features/search/data/constant/cons.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/build_lists.dart';
import 'package:flutter/material.dart';

class QuestionsColumnWidget extends StatelessWidget {
  const QuestionsColumnWidget(
      {super.key,
      required this.index,
      required this.currentIndex,
      required this.onCityTap,
      required this.onInterestTap,
      required this.onActivityTap});
  final int index;
  final int currentIndex;
  final dynamic Function(String) onCityTap;
  final dynamic Function(String) onInterestTap;
  final dynamic Function(String) onActivityTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            images[index],
            height: 240,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Text(
          LocalizedData.getTitles(context)[index],
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        if (currentIndex == 0) BuildSelectionAges(items: ages),
        if (currentIndex == 1)
          BuildSelectionList(
              items: LocalizedData.getCities(context),
              selectedItems: selectedCities,
              onTap: onCityTap),
        if (currentIndex == 2)
          BuildSelectionList(
              items: LocalizedData.getInterests(context),
              selectedItems: selectedInterests,
              onTap: onInterestTap),
        if (currentIndex == 3)
          BuildSelectionList(
              items: LocalizedData.getActivities(context),
              selectedItems: selectedActivities,
              onTap: onActivityTap),
      ],
    );
  }
}
