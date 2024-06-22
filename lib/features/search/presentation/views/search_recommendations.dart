import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:egy_exlpor/core/utils/custom_appBar.dart';
import 'package:egy_exlpor/features/search/data/models/recommended_places/recommended_places.dart';
import 'package:egy_exlpor/features/search/presentation/views/search_recommendations_results_view.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/build_dots.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/custom_question_container.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/recommender_api_service.dart';
import 'package:flutter/material.dart';

class SearchRecommendationsView extends StatefulWidget {
  const SearchRecommendationsView({super.key});
  static const String routeName = '/search_view';

  @override
  // ignore: library_private_types_in_public_api
  _SearchRecommendationsViewState createState() =>
      _SearchRecommendationsViewState();
}

class _SearchRecommendationsViewState extends State<SearchRecommendationsView> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onCityTap(String city) {
    setState(() {
      selectedCities.contains(city)
          ? selectedCities.remove(city)
          : selectedCities.add(city);
    });
  }

  void _onInterestTap(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else if (selectedInterests.length < 3) {
        selectedInterests.add(interest);
      } else {
        selectedInterests[selectedInterests.length - 1] = interest;
      }
    });
  }

  void _onActivityTap(String activity) {
    setState(() {
      if (selectedActivities.contains(activity)) {
        selectedActivities.remove(activity);
      } else if (selectedActivities.length < 3) {
        selectedActivities.add(activity);
      } else {
        selectedActivities[selectedActivities.length - 1] = activity;
      }
    });
  }

  List<String> images = [
    'assets/images/age.jpg',
    'assets/images/interests.jpg',
    'assets/images/location.jpg',
    'assets/images/activities.jpg',
  ];
  List<String> title = [
    'Select Your age range',
    'Select Your Interests',
    'Select Your Location',
    'Select Your Activities',
  ];
  Future<void> _makeApiRequest() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Search Recommendations"),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: 4,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        images[i],
                        height: 240,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      title[i],
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (currentIndex == 0)
                      _buildSelectionAges(ages, selectedAge, _onCityTap),
                    if (currentIndex == 1)
                      _buildSelectionList(cities, selectedCities, _onCityTap),
                    if (currentIndex == 2)
                      _buildSelectionList(
                          interests, selectedInterests, _onInterestTap),
                    if (currentIndex == 3)
                      _buildSelectionList(
                          activities, selectedActivities, _onActivityTap),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: _goToPreviousPage,
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
                  onTap: _goToNextPage,
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
          ),
        ],
      ),
    );
  }

  void _goToNextPage() async {
    if (currentIndex != title.length - 1) {
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
        await _makeApiRequest();

        log("done");
      }
    }
  }

  void _goToPreviousPage() {
    if (currentIndex != 0) {
      _controller.animateToPage(
        currentIndex - 1,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildSelectionList(
      List<String> items, List<String> selectedItems, Function(String) onTap) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => onTap(items[index]),
          child: CustomQuestionContainer(
            title: items[index],
            isSelected: selectedItems.contains(items[index]),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectionAges(
      List<String> items, String selectedItem, Function(String) onTap) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            selectedAge = items[index];
            setState(() {});
          },
          child: CustomQuestionContainer(
            title: items[index],
            isSelected: selectedItem == items[index],
          ),
        ),
      ),
    );
  }

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

  final List<String> cities = ["Cairo", "Alexandria", "Luxor", "Aswan", "Giza"];
  final List<String> ages = [
    "18 - 25",
    "25 - 35",
    "35 - 45",
    "45 - 50",
    "50 - up"
  ];
  final List<String> interests = [
    "History",
    "Religious",
    "Museums",
    "Adventure",
    "Nature",
    "Architecture",
    "Art"
  ];
  final List<String> activities = [
    "Guided Tours",
    "Cultural Experiences",
    "Outdoor Activities",
    "Architectural Tours",
    "Art Exhibitions",
    "Desert Safaris"
  ];
  String selectedAge = '';
  final List<String> selectedCities = [];
  final List<String> selectedInterests = [];
  final List<String> selectedActivities = [];
}
