import 'package:egy_exlpor/core/helpers/asset_helper.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/hotel_view.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/widgets/app_bar_container.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/widgets/gest_and_room_view.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/widgets/item_options_booking_widget.dart';
import 'package:egy_exlpor/features/explore/features/select_date/presentation/views/select_date_view.dart';
import 'package:egy_exlpor/features/explore/features/select_date/presentation/views/widgets/item_button_widget.dart';
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
    return AppBarContainer(
      titleString: 'Hotel Booking',
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 24 * 2,
            ),
            ItemOptionsBookingWidget(
              title: 'Destination',
              value: widget.destination ?? 'Viet Nam',
              icon: AssetHelper.icoLocation,
              onTap: () {},
            ),
            ItemOptionsBookingWidget(
              title: 'Select Date',
              value: selectDate ?? 'Select date',
              icon: AssetHelper.icoCalendal,
              onTap: () async {
                final result =
                    await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SelectDateView(),
                ));
                if (result is List<DateTime?>) {
                  setState(() {
                    selectDate =
                        '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                  });
                }
              },
            ),
            ItemOptionsBookingWidget(
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
            ItemButtonWidget(
              data: 'Search',
              onTap: () {
                Navigator.of(context).pushNamed(HotelView.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
