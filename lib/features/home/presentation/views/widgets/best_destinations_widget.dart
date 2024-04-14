import 'package:egy_exlpor/features/home/data/models/recommended_places_model.dart';
import 'package:egy_exlpor/features/home/presentation/views/widgets/best_destination_item.dart';
import 'package:flutter/material.dart';

class BestDestinationsWidget extends StatelessWidget {
  const BestDestinationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.395,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return BestDestinationItem(
              index: index,
            );
          },
          separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(right: 10),
              ),
          itemCount: recommendedPlaces.length),
    );
  }
}
