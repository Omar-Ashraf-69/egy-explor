import 'package:egy_exlpor/core/widgets/address_widget.dart';
import 'package:egy_exlpor/core/utils/spot_image.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/core/widgets/inapp_webview.dart';
import 'package:egy_exlpor/features/home/data/models/top_places.dart';
import 'package:egy_exlpor/features/home/presentation/views/widgets/love_icon_widget.dart';
import 'package:flutter/material.dart';

class BestDestinationItem extends StatelessWidget {
  const BestDestinationItem({
    super.key,
    required this.place,
  });
  final TopPlaces place;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: CardItem(
        place: place,
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.place,
  });

  final TopPlaces place;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
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
                      url:
                          'https://www.google.com/search?q=${place.name}&hl=${Localizations.localeOf(context).languageCode}')));
          // Navigator.pushNamed(context, SpotView.routeName);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SpotImage(
                notHomeScreen: false,
                imageUrl: place.image!,
                height: MediaQuery.of(context).size.height * 0.28,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 190,
                      child: Text(
                        place.name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle16.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.star,
                      color: Colors.yellow.shade700,
                      size: 22,
                    ),
                    Text(
                      place.rating.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Row(
                  children: [
                    AddressWidget(
                      location: place.locationString!,
                    ),
                    const Spacer(),
                    LoveIconWidget(
                      place: place,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
