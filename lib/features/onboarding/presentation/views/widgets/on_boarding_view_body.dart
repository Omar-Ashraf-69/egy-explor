import 'package:egy_exlpor/features/onboarding/presentation/views/widgets/swiper_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8,
      ),
      child: SwiperWidget(),
    );
  }
}
