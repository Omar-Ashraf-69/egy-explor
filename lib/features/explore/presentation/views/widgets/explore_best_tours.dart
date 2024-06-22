import 'package:dio/dio.dart';
import 'package:egy_exlpor/features/home/data/models/top_places.dart';
import 'package:egy_exlpor/features/home/presentation/views/widgets/best_destination_item.dart';
import 'package:egy_exlpor/features/home/presentation/views/widgets/recommender_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploreBestDestinationsWidget extends StatefulWidget {
  const ExploreBestDestinationsWidget({super.key});
  @override
  State<ExploreBestDestinationsWidget> createState() =>
      _BestDestinationsWidgetState();
}

class _BestDestinationsWidgetState
    extends State<ExploreBestDestinationsWidget> {
  static List<TopPlaces>? cachedPlaces;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.395,
      child: isLoading
          ? const Center(child: CupertinoActivityIndicator())
          : ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return BestDestinationItem(
                  place: cachedPlaces![index],
                );
              },
              separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.only(right: 10),
                  ),
              itemCount: cachedPlaces?.length ?? 0),
    );
  }

  Future<void> _fetchData() async {
    if (cachedPlaces != null) {
      // If data is cached, use it
      setState(() {});
      return;
    }

    isLoading = true;
    setState(() {});

    Dio dio = Dio();
    List<dynamic> response = await RecommenderApiService(dio).post(
      url: 'http://10.0.2.2:5001/recommend',
      body: {"user_id": "U3"},
    );

    if (response.isNotEmpty) {
      cachedPlaces =
          response.map((element) => TopPlaces.fromJson(element)).toList();
    } else {
      // Handle empty or error response
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to fetch data")),
      );
    }

    isLoading = false;
    setState(() {});
  }
}
