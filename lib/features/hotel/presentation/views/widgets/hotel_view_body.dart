import 'package:egy_exlpor/features/hotel/presentation/views/widgets/hotel_details_section.dart';
import 'package:egy_exlpor/features/hotel/presentation/views/widgets/view_hotel_part.dart';
import 'package:flutter/material.dart';

class HotelDetailsViewBody extends StatelessWidget {
  const HotelDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ViewHotelPart(),
            HotalDetailsSection(),
          ],
        ),
      ),
    );
  }
}
