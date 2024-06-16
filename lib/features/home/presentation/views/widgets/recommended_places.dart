import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/core/widgets/inapp_webview.dart';
import 'package:egy_exlpor/features/home/data/models/recommended_places_model.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HiddenGems extends StatelessWidget {
  const HiddenGems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.285,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 220,
              child: Card(
                elevation: 0.3,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomInAppWebView(
                              url: hiddenGems[index].bookingUrl),
                          // builder: (context) => TouristDetailsView(
                          //   image: recommendedPlaces[index].image,
                          // ),
                        ));
                    // Navigator.pushNamed(context, DestinationView.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            hiddenGems[index].image,
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.185,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              hiddenGems[index].cityName,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.textStyle16.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                              size: 15,
                            ),
                            Text(
                              hiddenGems[index].rating.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(
                              Ionicons.location_outline,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              hiddenGems[index].location,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(right: 10),
              ),
          itemCount: hiddenGems.length),
    );
  }
}
