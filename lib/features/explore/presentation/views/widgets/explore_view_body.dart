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
                    itemBuilder: (context, index) => const PopularSpotWidget(),
                    itemCount: 5,
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  // /// Section Widget
  // Widget _buildColumnpopularsp(BuildContext context) {
  //   return Align(
  //     alignment: Alignment.centerRight,
  //     child: Padding(
  //       padding: EdgeInsets.only(left: 21),
  //       child: Column(
  //         children: [
  //           Padding(
  //             padding: EdgeInsets.only(right: 11),
  //             child: _buildRowpopularspots(
  //               context,
  //               popularspots: "lbl_popular_spots",
  //               seeallOne: "lbl_see_all",
  //             ),
  //           ),
  //           SizedBox(height: 13),
  //           SizedBox(
  //             height: 159,
  //             child: BlocSelector<ExploreBloc, ExploreState, ExploreModel?>(
  //               selector: (state) => state.exploreModelObj,
  //               builder: (context, exploreModelObj) {
  //                 return ListView.separated(
  //                   scrollDirection: Axisorizontal,
  //                   separatorBuilder: (context, index) {
  //                     return SizedBox(
  //                       width: 10,
  //                     );
  //                   },
  //                   itemCount: exploreModelObj?.userprofileItemList.length ?? 0,
  //                   itemBuilder: (context, index) {
  //                     UserprofileItemModel model =
  //                         exploreModelObj?.userprofileItemList[index] ??
  //                             UserprofileItemModel();
  //                     return UserprofileItemWidget(
  //                       model,
  //                     );
  //                   },
  //                 );
  //               },
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // /// Section Widget
  // Widget _buildRow(BuildContext context) {
  //   return Align(
  //     alignment: Alignment.centerRight,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       children: [
  //         Container(
  //           width: 86,
  //           padding: EdgeInsets.symmetric(
  //             horizontal: 17,
  //             vertical: 8,
  //           ),
  //           decoration: AppDecoration.fillPrimary.copyWith(
  //             borderRadius: BorderRadiusStyle.roundedBorder12,
  //           ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               CustomImageView(
  //                 imagePath: ImageConstant.imgHotel1,
  //                 height: 12.adaptSize,
  //                 width: 12.adaptSize,
  //                 margin: EdgeInsets.only(bottom: 2),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.only(right: 1),
  //                 child: Text(
  //                   "lbl_hotel",
  //                   style: CustomTextStyles.labelLargeWhiteA700,
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //         Container(
  //           width: 87,
  //           margin: EdgeInsets.only(left: 15),
  //           padding: EdgeInsets.symmetric(
  //             horizontal: 17,
  //             vertical: 7,
  //           ),
  //           decoration: AppDecoration.white.copyWith(
  //             borderRadius: BorderRadiusStyle.roundedBorder12,
  //           ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               CustomImageView(
  //                 imagePath: ImageConstant.imgFlight2,
  //                 height: 12.adaptSize,
  //                 width: 12.adaptSize,
  //                 margin: EdgeInsets.symmetric(vertical: 2),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.only(
  //                   left: 8,
  //                   top: 1,
  //                 ),
  //                 child: Text(
  //                   "lbl_flight",
  //                   style: theme.textTheme.labelLarge,
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //         Container(
  //           width: 74,
  //           margin: EdgeInsets.only(left: 15),
  //           padding: EdgeInsets.symmetric(
  //             horizontal: 16,
  //             vertical: 8,
  //           ),
  //           decoration: AppDecoration.white.copyWith(
  //             borderRadius: BorderRadiusStyle.roundedBorder12,
  //           ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               CustomImageView(
  //                 imagePath: ImageConstant.imgBus1,
  //                 height: 12.adaptSize,
  //                 width: 12.adaptSize,
  //                 margin: EdgeInsets.symmetric(vertical: 1),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.only(left: 8),
  //                 child: Text(
  //                   "lbl_bus",
  //                   style: theme.textTheme.labelLarge,
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //         Container(
  //           width: 80,
  //           margin: EdgeInsets.only(left: 15),
  //           padding: EdgeInsets.symmetric(
  //             horizontal: 16,
  //             vertical: 8,
  //           ),
  //           decoration: AppDecoration.white.copyWith(
  //             borderRadius: BorderRadiusStyle.roundedBorder12,
  //           ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               CustomImageView(
  //                 imagePath: ImageConstant.imgBoat1,
  //                 height: 12.adaptSize,
  //                 width: 12.adaptSize,
  //                 margin: EdgeInsets.symmetric(vertical: 1),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.only(left: 8),
  //                 child: Text(
  //                   "lbl_boat",
  //                   style: theme.textTheme.labelLarge,
  //                 ),
  //               )
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // /// Section Widget
  // Widget _buildRowsafarivalley(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.only(left: 16),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         _buildStackniletour(
  //           context,
  //           imageOne: ImageConstant.imgRectangle35,
  //           niletour: "msg_safari_valley_special",
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(left: 10),
  //           child: _buildStackniletour(
  //             context,
  //             imageOne: ImageConstant.imgRectangle3567x120,
  //             niletour: "lbl_nile_tour",
  //           ),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(left: 10),
  //           child: _buildStackniletour(
  //             context,
  //             imageOne: ImageConstant.imgRectangle351,
  //             niletour: "lbl_cairo_tour",
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // /// Common widget
  // Widget _buildRowpopularspots(
  //   BuildContext context, {
  //   required String popularspots,
  //   required String seeallOne,
  // }) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         popularspots,
  //         style: theme.textTheme.titleMedium!.copyWith(
  //           color: theme.colorScheme.onErrorContainer,
  //         ),
  //       ),
  //       Padding(
  //         padding: EdgeInsets.only(
  //           left: 181,
  //           bottom: 6,
  //         ),
  //         child: Text(
  //           seeallOne,
  //           style: CustomTextStyles.labelLargePrimary.copyWith(
  //             color: theme.colorScheme.primary,
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  // /// Common widget
  // Widget _buildStackniletour(
  //   BuildContext context, {
  //   required String imageOne,
  //   required String niletour,
  // }) {
  //   return Card(
  //     clipBehavior: Clip.antiAlias,
  //     elevation: 0,
  //     margin: EdgeInsets.all(0),
  //     color: appTheme.gray10001,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadiusStyle.roundedBorder15,
  //     ),
  //     child: Container(
  //       height: 116,
  //       width: 120,
  //       decoration: AppDecoration.fillGray10001.copyWith(
  //         borderRadius: BorderRadiusStyle.roundedBorder15,
  //       ),
  //       child: Stack(
  //         alignment: Alignment.topCenter,
  //         children: [
  //           CustomImageView(
  //             imagePath: imageOne,
  //             height: 67,
  //             width: 120,
  //             radius: BorderRadiusertical(
  //               top: Radius.circular(15),
  //             ),
  //             alignment: Alignment.topCenter,
  //           ),
  //           Align(
  //             alignment: Alignment.topCenter,
  //             child: Container(
  //               padding: EdgeInsets.symmetric(
  //                 horizontal: 3,
  //                 vertical: 4,
  //               ),
  //               decoration:
  //                   AppDecoration.gradientErrorContainerToOnPrimary1.copyWith(
  //                 borderRadius: BorderRadiusStyle.customBorderTL15,
  //               ),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   SizedBox(height: 48),
  //                   Text(
  //                     niletour,
  //                     style: theme.textTheme.labelSmall!.copyWith(
  //                       color: appTheme.whiteA700,
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
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
