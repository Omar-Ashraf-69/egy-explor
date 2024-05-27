import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/core/widgets/section_header.dart';
import 'package:egy_exlpor/features/explore/presentation/views/widgets/appbar.dart';
import 'package:egy_exlpor/features/explore/presentation/views/widgets/category_item.dart';
import 'package:egy_exlpor/features/explore/presentation/views/widgets/fantastic__tours_item.dart';
import 'package:egy_exlpor/features/explore/presentation/views/widgets/popular_spot_item.dart';
import 'package:egy_exlpor/features/explore/presentation/views/widgets/services_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ExploreViewBody extends StatelessWidget {
  const ExploreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 4),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: exploreViewAppBar(context),
          body: Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14, top: 10),
            child: Column(
              children: [
                SearchBar(
                  elevation: const WidgetStatePropertyAll(0),
                  backgroundColor: WidgetStatePropertyAll(kWhiteColor),
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Icon(
                      IconlyLight.search,
                      color: kGreyColor,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  hintText: 'Search',
                  hintStyle: WidgetStatePropertyAll(
                    Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.w600,
                      color: kGreyColor,
                    ),
                  ),
                  textStyle: const WidgetStatePropertyAll(TextStyle(
                    color: kBlackColor,
                  )),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        const SectionHeader(title: "Categories"),
                        const SizedBox(
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
                        const SizedBox(
                          height: 12,
                        ),
                        const SectionHeader(title: "Popular Spots"),
                        const SizedBox(
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
                        const SizedBox(
                          height: 12,
                        ),
                        const SectionHeader(title: 'Services'),
                        const SizedBox(
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
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const SectionHeader(title: 'Fantastic Tours'),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                            itemCount: 4,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                const FantasticTourWidget(),
                          ),
                        ),
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

final List<Map<String, String>> categoryItems = [
  {'title': 'Safari', 'iconImage': AssetsData.iconSafari},
  {'title': 'Camp', 'iconImage': AssetsData.iconCamp},
  {'title': 'Beach', 'iconImage': AssetsData.iconBeach},
  {'title': 'Mountains', 'iconImage': AssetsData.iconMountain},
  {'title': 'Lake', 'iconImage': AssetsData.iconLake},
];
