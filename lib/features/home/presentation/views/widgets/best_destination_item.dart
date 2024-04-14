import 'package:egy_exlpor/core/utils/address_widget.dart';
import 'package:egy_exlpor/core/utils/spot_image.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/home/data/models/recommended_places_model.dart';
import 'package:egy_exlpor/features/home/presentation/views/tourist_details_view.dart';
import 'package:egy_exlpor/features/home/presentation/views/widgets/love_icon_widget.dart';
import 'package:flutter/material.dart';

class BestDestinationItem extends StatelessWidget {
  const BestDestinationItem({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: CardItem(index: index),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.index,
  });

  final int index;

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
              builder: (context) => TouristDetailsView(
                image: recommendedPlaces[index].image,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SpotImage(
                notHomeScreen: false,
                index: index,
                height: MediaQuery.of(context).size.height * 0.28,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  children: [
                    Text(
                      "St Regis Bora Bora",
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.star,
                      color: Colors.yellow.shade700,
                      size: 22,
                    ),
                    const Text(
                      "4.4",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Row(
                  children: [
                    AddressWidget(),
                    Spacer(),
                    LoveIconWidget(),
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
