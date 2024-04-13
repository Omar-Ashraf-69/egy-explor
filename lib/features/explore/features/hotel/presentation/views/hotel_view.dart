import 'package:egy_exlpor/core/helpers/asset_helper.dart';
import 'package:egy_exlpor/core/models/hotel_model.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/detail_hotel_view.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/widgets/app_bar_container.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/widgets/item_hotel_widget.dart';
import 'package:flutter/material.dart';
class HotelView extends StatefulWidget {
  const HotelView({super.key});

  static const String routeName = '/hotels_view';

  @override
  State<HotelView> createState() => _HotelViewState();
}

class _HotelViewState extends State<HotelView> {
  final List<HotelModel> listHotel = [
    HotelModel(
      hotelImage: AssetHelper.hotel1,
      hotelName: 'Royal Palm Heritage',
      location: 'Purwokerto, Jateng',
      awayKilometer: '364 m',
      star: 4.5,
      numberOfReview: 3241,
      price: 143,
    ),
    HotelModel(
      hotelImage: AssetHelper.hotel2,
      hotelName: 'Grand Luxury\'s',
      location: 'Banyumas, Jateng',
      awayKilometer: '2.3 km',
      star: 4.2,
      numberOfReview: 3241,
      price: 234,
    ),
    HotelModel(
      hotelImage: AssetHelper.hotel3,
      hotelName: 'The Orlando House',
      location: 'Ajibarang, Jateng',
      awayKilometer: '1.1 km',
      star: 3.8,
      numberOfReview: 1234,
      price: 132,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      implementTraling: true,
      titleString: 'Hotels',
      child: SingleChildScrollView(
        child: Column(
          children: listHotel
              .map(
                (e) => ItemHotelWidget(
                  hotelModel: e,
                  onTap: () {
                    Navigator.of(context).pushNamed(DetailHotelView.routeName, arguments: e);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
