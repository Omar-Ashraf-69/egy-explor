import 'package:egy_exlpor/features/hotel/presentation/views/widgets/hotel_view_body.dart';
import 'package:flutter/material.dart';

class HotelDetailsView extends StatelessWidget {
  const HotelDetailsView({super.key});
  static const String routeName = '/hotel_details_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HotelDetailsViewBody(),
    );
  }
}
