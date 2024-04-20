import 'dart:ui';

import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/core/widgets/address_widget.dart';
import 'package:egy_exlpor/core/widgets/section_header.dart';
import 'package:egy_exlpor/features/explore/presentation/views/widgets/appbar.dart';
import 'package:egy_exlpor/features/home/presentation/views/widgets/love_icon_widget.dart';
import 'package:egy_exlpor/core/widgets/rate_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:ionicons/ionicons.dart';

class ExploreViewBody extends StatelessWidget {
  const ExploreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: exploreViewAppBar(context),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
            child: Column(
              children: [
                SearchBar(
                  elevation: MaterialStatePropertyAll(0),
                  backgroundColor: MaterialStatePropertyAll(kWhiteColor),
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Icon(
                      IconlyLight.search,
                      color: kGreyColor,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  hintText: 'Search',
                  hintStyle: MaterialStatePropertyAll(
                    Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.w600,
                      color: kGreyColor,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        SectionHeader(title: "Categories"),
                        SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => CategoryItem(
                              iconImage: categoryItems[index]['iconImage']!,
                              title: categoryItems[index]['title']!,
                            ),
                            itemCount: categoryItems.length,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        SectionHeader(title: "Popular Spots"),
                        SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: 170,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                const PopularSpotWidget(),
                            itemCount: 5,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        SectionHeader(title: 'Services'),
                        SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: 35,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: servicesItems.length,
                            itemBuilder: (context, index) => ServicesItemWidget(
                              iconImage: servicesItems[index]['iconImage']!,
                              title: servicesItems[index]['title']!,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final List<Map<String, String>> servicesItems = [
  {'title': 'Airplane', 'iconImage': AssetsData.iconAirplane},
  {'title': 'Hotel', 'iconImage': AssetsData.iconHotel},
  {'title': 'Uber', 'iconImage': AssetsData.iconCar},
  {'title': 'Restaurant', 'iconImage': AssetsData.iconFood},
];

class ServicesItemWidget extends StatelessWidget {
  const ServicesItemWidget({
    super.key,
    required this.iconImage,
    required this.title,
  });
  final String iconImage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14.0, bottom: 1.5),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 10),
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              iconImage,
              height: 18,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 5),
            Text(
              title,
              style: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        color: kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class PopularSpotWidget extends StatelessWidget {
  const PopularSpotWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14.0),
      child: SizedBox(
        width: 200,
        height: 170,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                AssetsData.imgRectangle18,
                height: 170,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 7,
              right: 10,
              child: LoveIconWidget(
                iconSize: 33,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sant Caterin",
                      style: Styles.textStyle14.copyWith(
                        color: kWhiteColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Row(
                      children: [
                        AddressWidget(
                          color: kWhiteColor,
                          size: 10,
                        ),
                        Spacer(),
                        RateWidget(
                          color: kWhiteColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> categoryItems = [
  {'title': 'Safari', 'iconImage': AssetsData.iconSafari},
  {'title': 'Camp', 'iconImage': AssetsData.iconCamp},
  {'title': 'Beach', 'iconImage': AssetsData.iconBeach},
  {'title': 'Mountains', 'iconImage': AssetsData.iconMountain},
  {'title': 'Lake', 'iconImage': AssetsData.iconLake},
];

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
    required this.iconImage,
  });
  final String title;
  final String iconImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14.0),
      child: Container(
        width: 75,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                iconImage,
                color: kPrimaryBlueColor,
                height: 40,
                width: 45,
              ),
              Text(
                title,
                style: Styles.textStyle12.copyWith(
                  fontWeight: FontWeight.w600,
                  color: kGreyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
