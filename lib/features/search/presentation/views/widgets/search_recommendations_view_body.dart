import 'package:egy_exlpor/core/utils/custom_appBar.dart';
import 'package:egy_exlpor/features/search/data/constant/func.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/navigation_controller.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/question_column.dart';
import 'package:egy_exlpor/generated/l10n.dart';
import 'package:flutter/material.dart';

class SearchRecommendationsViewBody extends StatefulWidget {
  const SearchRecommendationsViewBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchRecommendationsViewState createState() =>
      _SearchRecommendationsViewState();
}

class _SearchRecommendationsViewState
    extends State<SearchRecommendationsViewBody> {
  int currentIndex = 0;
  late PageController _controller;
  late NavigationFunc navigator;
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
      onCityTap(city);
    });
  }

  void _onInterestTap(String interest) {
    setState(() {
      onInterestTap(interest);
    });
  }

  void _onActivityTap(String activity) {
    setState(() {
      onActivityTap(activity);
    });
  }

  @override
  Widget build(BuildContext context) {
    navigator =
        NavigationFunc(context, _controller, currentIndex: currentIndex);
    return Scaffold(
      appBar: customAppBar(title: S.of(context).searchRecommendations),
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
                return QuestionsColumnWidget(
                  index: i,
                  currentIndex: currentIndex,
                  onCityTap: _onCityTap,
                  onInterestTap: _onInterestTap,
                  onActivityTap: _onActivityTap,
                );
              },
            ),
          ),
          NavigationController(
            currentIndex: currentIndex,
            onBackTap: navigator.goToPreviousPage,
            onForwardTap: navigator.goToNextPage,
          ),
        ],
      ),
    );
  }
}