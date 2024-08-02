import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:egy_exlpor/features/search/data/constant/cons.dart';
import 'package:egy_exlpor/features/search/data/models/recommended_places/recommended_places.dart';
import 'package:egy_exlpor/features/search/presentation/views/search_recommendations_results_view.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/recommender_api_service.dart';
import 'package:flutter/material.dart';

int getAge(String selectedAgeRange) {
  int middleAge = 0;

// Split the selected age range string by the '-' character
  List<String> ageRangeValues = selectedAgeRange.split(' - ');

// Get the middle value from the age range
  if (ageRangeValues.length == 2) {
    int startAge = int.parse(ageRangeValues[0]);
    int endAge = int.parse(ageRangeValues[1]);
    middleAge = (startAge + endAge) ~/ 2; // Calculate the middle value
  }
  return middleAge;
}

Future<void> makeApiRequest(context) async {
  Dio dio = Dio();
  try {
    Map<String, dynamic> response = await RecommenderApiService(dio)
        .post(url: 'http://10.0.2.2:5002/recommend', body: {
      "age": getAge(selectedAge),
      "location": selectedCities.join(", "),
      "interests": selectedInterests.join(", "),
      "activities": selectedActivities.join(", "),
      "cultural_preferences": "traditional, heritage"
    });

    List<RecommendedPlaces> recommendedPlacesList = [];
    // log(response['data'].toString());
    for (var jsonItem in response['data']) {
      // log(jsonItem.toString());
      recommendedPlacesList.add(RecommendedPlaces.fromJson(jsonItem));
    }

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              SearchRecommendationsResultView(places: recommendedPlacesList)),
    );
  } catch (e) {
    log("Error: $e");
  }
}

//! Selection function for the Recommender questions !//

class SelectionFunc {
  static void onCityTap(String city, void Function(void Function()) func) {
    func(() {
      if (selectedCities.contains(city)) {
        selectedCities.remove(city);
      } else if (selectedCities.length < 3) {
        selectedCities.add(city);
      } else {
        selectedCities[selectedCities.length - 1] = city;
      }
    });
  }

  void onInterestTap(String interest, void Function(void Function()) func) {
    func(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else if (selectedInterests.length < 3) {
        selectedInterests.add(interest);
      } else {
        selectedInterests[selectedInterests.length - 1] = interest;
      }
    });
  }

  void onActivityTap(
      {required String activity,
      required void Function(void Function()) func}) {
    func(() {
      if (selectedActivities.contains(activity)) {
        selectedActivities.remove(activity);
      } else if (selectedActivities.length < 3) {
        selectedActivities.add(activity);
      } else {
        selectedActivities[selectedActivities.length - 1] = activity;
      }
    });
  }
}

//!           Navigation functions         !//

class NavigationFunc {
  final int currentIndex;
  final PageController _controller;
  BuildContext context;

   NavigationFunc(this.context,this._controller, {required this.currentIndex});

   void goToNextPage() async {
    //                    title.length
    if (currentIndex != 3) {
      _controller.animateToPage(
        currentIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      if (selectedCities.isNotEmpty &&
          selectedInterests.isNotEmpty &&
          selectedActivities.isNotEmpty &&
          selectedAge.isNotEmpty) {
        // _makeApiRequest();
        await makeApiRequest(context);

        log("done");
      }
    }
  }

  void goToPreviousPage() {
    if (currentIndex != 0) {
      _controller.animateToPage(
        currentIndex - 1,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }
  }
}



//!         Taps functions          !//

  void onCityTap(String city){
if (selectedCities.contains(city)) {
        selectedCities.remove(city);
      } else if (selectedCities.length < 3) {
        selectedCities.add(city);
      } else {
        selectedCities[selectedCities.length - 1] = city;
      }
  }
  void onInterestTap(String interest){
    if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else if (selectedInterests.length < 3) {
        selectedInterests.add(interest);
      } else {
        selectedInterests[selectedInterests.length - 1] = interest;
      }
  }

void onActivityTap(String activity){

 if (selectedActivities.contains(activity)) {
        selectedActivities.remove(activity);
      } else if (selectedActivities.length < 3) {
        selectedActivities.add(activity);
      } else {
        selectedActivities[selectedActivities.length - 1] = activity;
      }
}
