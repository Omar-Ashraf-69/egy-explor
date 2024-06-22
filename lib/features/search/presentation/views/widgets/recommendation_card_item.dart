import 'dart:developer';
import 'package:egy_exlpor/core/widgets/address_widget.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/core/widgets/inapp_webview.dart';
import 'package:egy_exlpor/features/search/data/models/recommended_places/recommended_places.dart';
import 'package:egy_exlpor/core/widgets/rate_widget.dart';
import 'package:egy_exlpor/features/search/presentation/views/widgets/recommended_spot_image.dart';
import 'package:flutter/material.dart';

class RecommendationCardItem extends StatelessWidget {
  const RecommendationCardItem({
    super.key,
    required this.place,
  });
  final RecommendedPlaces place;

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
          onTap: () {
            log("onTap: ${place.name}");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomInAppWebView(
                        url:
                            'https://www.google.com/search?q=${place.name}&hl=${Localizations.localeOf(context).languageCode}')));
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RecommendedSpotImage(
                  imageUrl: place.image!,
                ),
                const SizedBox(height: 5),
                Text(
                  place.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                AddressWidget(
                  location: place.locationString!,
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // PriceWidget(),
                    RateWidget(
                      rate: place.rating.toString(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
