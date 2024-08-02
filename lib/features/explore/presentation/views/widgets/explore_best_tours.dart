import 'package:dio/dio.dart';
import 'package:egy_exlpor/features/home/data/models/top_places.dart';
import 'package:egy_exlpor/features/home/presentation/views/widgets/best_destination_item.dart';
import 'package:egy_exlpor/features/home/presentation/views/widgets/recommender_api_service.dart';
import 'package:flutter/cupertino.dart';

class ExploreBestDestinationsWidget extends StatefulWidget {
  const ExploreBestDestinationsWidget({super.key});

  @override
  State<ExploreBestDestinationsWidget> createState() =>
      _ExploreBestDestinationsWidgetState();
}

class _ExploreBestDestinationsWidgetState
    extends State<ExploreBestDestinationsWidget> {
  Future<List<TopPlaces>>? _futurePlaces;
  static List<TopPlaces>? _cachedPlaces;

  @override
  void initState() {
    super.initState();
    if (_cachedPlaces == null) {
      _futurePlaces = _fetchData();
    } else {
      _futurePlaces = Future.value(_cachedPlaces);
    }
  }

  Future<List<TopPlaces>> _fetchData() async {
    Dio dio = Dio();
    List<dynamic> response = await RecommenderApiService(dio).post(
      url: 'http://10.0.2.2:5001/recommend',
      body: {"user_id": "U2"},
    );

    if (response.isNotEmpty) {
      _cachedPlaces = response.map((element) => TopPlaces.fromJson(element)).toList();
      return _cachedPlaces!;
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.395,
      child: FutureBuilder<List<TopPlaces>>(
        future: _futurePlaces,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            final places = snapshot.data!;
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return BestDestinationItem(
                  place: places[index],
                );
              },
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(right: 10),
              ),
              itemCount: places.length,
            );
          } else {
            return const Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}
