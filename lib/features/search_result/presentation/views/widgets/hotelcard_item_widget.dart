import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/custom_image_view.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/home/presentation/views/widgets/love_icon_widget.dart';
import 'package:egy_exlpor/core/widgets/rate_widget.dart';
import 'package:egy_exlpor/features/search_result/data/models/hotelcard_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
// ignore_for_file: must_be_immutable

class HotelcardItemWidget extends StatelessWidget {
  HotelcardItemWidget(this.hotelcardItemModelObj, {super.key});

  HotelcardItemModel hotelcardItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 138,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: kWhiteColor),
      padding: EdgeInsets.only(
        right: 12,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: hotelcardItemModelObj.hotelImage!,
            height: 130,
            width: 120,
            radius: const BorderRadius.horizontal(
              left: Radius.circular(15),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        hotelcardItemModelObj.hotelName!,
                        style: Styles.textStyle14.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        // style: theme.textTheme.titleSmall,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 12.0, right: 4, left: 4),
                      child: const LoveIconWidget(
                        iconSize: 26,
                      ),
                    ),
                  ],
                ),
                const RateWidget(),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      IconlyLight.location,
                      size: 18,
                      color: kGreyColor,
                    ),
                    Text(
                      hotelcardItemModelObj.locationText!,
                      // style: theme.textTheme.labelLarge,
                      style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.w600,
                        color: kGreyColor,
                      ),
                    )
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        hotelcardItemModelObj.priceText!,
                        style: Styles.textStyle18.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        // style: theme.textTheme.titleMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.5),
                        child: Text(
                          hotelcardItemModelObj.priceUnitText!,
                          style: Styles.textStyle12,
                          // style: theme.textTheme.bodySmall,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 28,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(kPrimaryColor),
                            padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Book Now',
                            style: Styles.textStyle12.copyWith(
                              color: kWhiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}