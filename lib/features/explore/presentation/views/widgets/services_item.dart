import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/explore/features/flight_booking_inapp_webview/flight_booking_inapp_webview.dart';
import 'package:egy_exlpor/features/explore/features/hotel_booking/hotel_booking_inapp_webview.dart';
import 'package:egy_exlpor/features/explore/features/restaurant/restaurnat.dart';
import 'package:egy_exlpor/features/explore/features/uber/uber_view.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 18),
        onPressed: () {
          if (title == 'Airplane') {
            // Navigator.pushNamed(context, HotelBookingView.routeName);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FlightBookingInappWebview(),
              ),
            );
          }
          if (title == 'Hotel') {
            // Navigator.pushNamed(context, HotelBookingView.routeName);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HotelBookingInappWebview(),
              ),
            );
          }
          if (title == 'Restaurant') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RestaurnatView(),
              ),
            );
          }
          if (title == 'Uber') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UberView(),
              ),
            );
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
              height: 24,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: Styles.textStyle18.copyWith(
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
