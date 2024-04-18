
import 'package:card_swiper/card_swiper.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImagesSwiper extends StatelessWidget {
  ImagesSwiper({
    super.key,
  });

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Swiper(
        itemCount: 2,
        pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: kSeconderyBlueColor,
            activeColor: kPrimaryColor,
          ),
        ),
        index: currentPage,
        itemBuilder: (context, index) {
          // return CustomImageView(
          //   imagePath: 'assets/places/place3.jpg',
          //   width: double.infinity,
          // );
          return Image.asset(
            'assets/places/place3.jpg',
            width: double.infinity,
            height: 400,
            fit: BoxFit.cover,
          );
        });
  }
}
