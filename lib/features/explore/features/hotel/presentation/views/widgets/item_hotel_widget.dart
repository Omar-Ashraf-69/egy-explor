import 'package:egy_exlpor/core/constants/dimension_constants.dart';
import 'package:egy_exlpor/core/constants/textstyle_ext.dart';
import 'package:egy_exlpor/core/helpers/asset_helper.dart';
import 'package:egy_exlpor/core/models/hotel_model.dart';
import 'package:egy_exlpor/core/utils/image_helper.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/widgets/dash_line.dart';
import 'package:egy_exlpor/features/explore/features/select_date/presentation/views/widgets/item_button_widget.dart';
import 'package:flutter/material.dart';

class ItemHotelWidget extends StatelessWidget {
  const ItemHotelWidget({
    super.key,
    required this.hotelModel,
    this.onTap,
  });

  final HotelModel hotelModel;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: Colors.white,
      ),
      margin:const EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin:const EdgeInsets.only(right: kDefaultPadding),
            child: ImageHelper.loadFromAsset(
              hotelModel.hotelImage,
              radius:const BorderRadius.only(
                topLeft: Radius.circular(
                  kDefaultPadding,
                ),
                bottomRight: Radius.circular(
                  kDefaultPadding,
                ),
              ),
            ),
          ),
          Padding(
            padding:const EdgeInsets.all(
              kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelModel.hotelName,
                  style: TextStyles.defaultStyle.fontHeader.bold,
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(
                      AssetHelper.icoLocationBlank,
                    ),
                    const SizedBox(
                      width: kMinPadding,
                    ),
                    Text(
                      hotelModel.location,
                    ),
                    Text(
                      ' - ${hotelModel.awayKilometer} from destination',
                      style: TextStyles.defaultStyle.subTitleTextColor.fontCaption,
                      maxLines: 2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(
                      AssetHelper.icoStar,
                    ),
                    const SizedBox(
                      width: kMinPadding,
                    ),
                    Text(
                      hotelModel.star.toString(),
                    ),
                    Text(
                      ' (${hotelModel.numberOfReview} reviews)',
                      style: TextStyles.defaultStyle.subTitleTextColor,
                    ),
                  ],
                ),
                const DashLineWidget(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${hotelModel.price.toString()}',
                            style: TextStyles.defaultStyle.fontHeader.bold,
                          ),
                          const SizedBox(
                            height: kMinPadding,
                          ),
                          Text(
                            '/night',
                            style: TextStyles.defaultStyle.fontCaption,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ItemButtonWidget(
                        data: 'Book a room',
                        onTap: onTap,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
