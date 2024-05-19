import 'package:egy_exlpor/core/helpers/asset_helper.dart';
import 'package:egy_exlpor/core/utils/custom_appBar.dart';
import 'package:egy_exlpor/core/utils/custom_button_widget.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/explore/features/hotel_booking/presentation/views/widgets/gest_and_room_view.dart';
import 'package:egy_exlpor/features/explore/features/hotel_booking/presentation/views/widgets/booking_options_widget.dart';
import 'package:egy_exlpor/features/explore/features/hotel_booking/presentation/views/widgets/select_date_view.dart';
import 'package:egy_exlpor/features/search_result/presentation/views/search_result_view.dart';
import 'package:flutter/material.dart';
import 'package:egy_exlpor/core/extensions/date_ext.dart';

class HotelBookingView extends StatefulWidget {
  const HotelBookingView({super.key, this.destination});
  static const String routeName = '/hotel_booking_view';

  final String? destination;

  @override
  State<HotelBookingView> createState() => _HotelBookingViewState();
}

class _HotelBookingViewState extends State<HotelBookingView> {
  String? selectDate;
  String? guestAndRoom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Hotel Booking'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          children: [
            BookingOptionsWidget(
              title: 'Destination',
              value: widget.destination ?? 'Select Destination',
              icon: AssetHelper.icoLocation,
              onTap: () {},
            ),
            BookingOptionsWidget(
              title: 'Select Date',
              value: selectDate ?? 'Select date',
              icon: AssetHelper.icoCalendal,
              onTap: () async {
                final result = await Navigator.of(context)
                    .pushNamed(SelectDateView.routeName);
                if (result is List<DateTime?>) {
                  setState(() {
                    selectDate =
                        '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                  });
                }
              },
            ),
            BookingOptionsWidget(
              title: 'Guest and Room',
              value: guestAndRoom ?? 'Guest and Room',
              icon: AssetHelper.icoBed,
              onTap: () async {
                final result = await Navigator.of(context)
                    .pushNamed(GuestAndRoomView.routeName);
                if (result is List<int>) {
                  setState(() {
                    guestAndRoom = '${result[0]} Guest, ${result[1]} Room';
                  });
                }
              },
            ),
            CustomButtonWidget(
              label: Text(
                "Search",
                style: Styles.textStyle18.copyWith(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(SearchResultView.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
