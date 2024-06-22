import 'package:egy_exlpor/core/widgets/address_widget.dart';
import 'package:egy_exlpor/core/utils/spot_image.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/core/widgets/inapp_webview.dart';
import 'package:egy_exlpor/features/home/data/models/top_places.dart';
import 'package:flutter/material.dart';

class FavoritesCardItem extends StatelessWidget {
  const FavoritesCardItem({
    super.key,
    required this.favorite,
  });

  final TopPlaces favorite;
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomInAppWebView(
                        url:
                            'https://www.google.com/search?q=${favorite.name}&hl=${Localizations.localeOf(context).languageCode}')));
            // Navigator.pushNamed(context, SpotView.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpotImage(
                  isFavoritesView: true,
                  imageUrl: favorite.image!,
                  // 'https://media-cdn.tripadvisor.com/media/photo-o/01/79/a3/1f/kairo.jpg',
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5 - 20,
                  child: Text(
                    favorite.name!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                AddressWidget(
                  location: favorite.locationString!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
