
  import 'package:egy_exlpor/generated/l10n.dart';
import 'package:flutter/material.dart';

final List<String> ages = [
    "18 - 25",
    "25 - 35",
    "35 - 45",
    "45 - 50",
    "50 - up"
  ];

  String selectedAge = '';
  final List<String> selectedCities = [];
  final List<String> selectedInterests = [];
  final List<String> selectedActivities = [];


List<String> images = [
    'assets/images/age.jpg',
    'assets/images/interests.jpg',
    'assets/images/location.jpg',
    'assets/images/activities.jpg',
  ];
  

class LocalizedData {
  static List<String> getCities(BuildContext context) {
    return [
      S.of(context).cairo,
      S.of(context).alexandria,
      S.of(context).luxor,
      S.of(context).aswan,
      S.of(context).giza
    ];
  }

  static List<String> getActivities(BuildContext context) {
    return [
      S.of(context).guidedTours,
      S.of(context).culturalExperiences,
      S.of(context).outdoorActivities,
      S.of(context).architecturalTours,
      S.of(context).artExhibitions,
      S.of(context).desertSafaris,
    ];
  }

  static List<String> getInterests(BuildContext context) {
    return [
      S.of(context).history,
      S.of(context).religious,
      S.of(context).museums,
      S.of(context).adventure,
      S.of(context).nature,
      S.of(context).architecture,
      S.of(context).art,
    ];
  }

  static List<String> getTitles(BuildContext context) {
    return [
      S.of(context).selectYourAgeRange,
      S.of(context).selectYourInterests,
      S.of(context).selectYourLocation,
      S.of(context).selectYourActivities,
    ];
  }

  
}
