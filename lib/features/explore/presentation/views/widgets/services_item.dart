import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/hotel_booking_view.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/hotel_view.dart';
import 'package:egy_exlpor/features/hotel/presentation/views/hotel_view.dart';
import 'package:egy_exlpor/features/search_result/presentation/views/search_result_view.dart';
import 'package:flutter/material.dart';

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
        elevation: 0.1,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        onPressed: () {
          if (title == 'Hotel') {
            Navigator.pushNamed(context, SearchResultView.routeName);
          }
          if (title == 'Restaurant') {
            Navigator.pushNamed(context, HotelBookingView.routeName);
          }
        },
        color: kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              iconImage,
              height: 18,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.w800,
                color: kBlackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
