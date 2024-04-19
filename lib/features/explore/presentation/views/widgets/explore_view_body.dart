import 'package:egy_exlpor/features/explore/presentation/views/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ExploreViewBody extends StatelessWidget {
  const ExploreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: exploreViewAppBar(context),
        body: Column(children: [
          
        ],),
      ),
    );
  }

  /// Section Widget

  // /// Section Widget
  // Widget _buildColumncategorie(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.only(
  //       left: 21,
  //       right: 11,
  //     ),
  //     child: Column(
  //       children: [
  //         _buildRowpopularspots(
  //           context,
  //           popularspots: "lbl_categories",
  //           seeallOne: "lbl_see_all",
  //         ),
  //         SizedBox(height: 13),
  //         SizedBox(
  //           height: 73,
  //           child: BlocSelector<ExploreBloc, ExploreState, ExploreModel?>(
  //             selector: (state) => state.exploreModelObj,
  //             builder: (context, exploreModelObj) {
  //               return ListView.separated(
  //                 scrollDirection: Axisorizontal,
  //                 separatorBuilder: (context, index) {
  //                   return SizedBox(
  //                     width: 17,
  //                   );
  //                 },
  //                 itemCount:
  //                     exploreModelObj?.listmountaintexItemList.length ?? 0,
  //                 itemBuilder: (context, index) {
  //                   ListmountaintexItemModel model =
  //                       exploreModelObj?.listmountaintexItemList[index] ??
  //                           ListmountaintexItemModel();
  //                   return ListmountaintexItemWidget(
  //                     model,
  //                   );
  //                 },
  //               );
  //             },
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

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
