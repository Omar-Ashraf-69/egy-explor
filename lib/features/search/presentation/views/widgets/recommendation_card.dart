import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/home/data/models/recommended_places_model.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/price_rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class RecommendationCardItem extends StatelessWidget {
  const RecommendationCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Card(
        elevation: 0.5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    recommendedPlaces[4].image,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                    height: 140,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "St Regis Bora Bora",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Row(
                  children: [
                    Icon(
                      Ionicons.location_outline,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "French Polynesia",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                const PriceRateWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
