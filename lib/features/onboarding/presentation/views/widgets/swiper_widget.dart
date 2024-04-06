import 'package:card_swiper/card_swiper.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/custom_button_widget.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/auth/presentation/views/login_view.dart';
import 'package:egy_exlpor/features/onboarding/presentation/views/widgets/on_boarding_widget.dart';
import 'package:flutter/material.dart';

class SwiperWidget extends StatefulWidget {
  const SwiperWidget({super.key});

  @override
  State<SwiperWidget> createState() => SwiperWidgetState();
}

class SwiperWidgetState extends State<SwiperWidget> {
  static PageController pageController = PageController();
  int currentPage = 0;
  static bool isLastPage = false;
  List<OnBoardingPageWidget> pages = const [
    OnBoardingPageWidget(
      title: 'Life is Short and The world is ',
      suffixText: 'Wide',
      subTitle:
          'At Friends tours and travel, we customize reliable and trutworthy educational tours to destinations all over the world',
      image: 'assets/images/finance1.png',
    ),
    OnBoardingPageWidget(
      title: "People don't take trips trips take ",
      suffixText: 'people',
      subTitle:
          'To get the best of your adventure you just need to leave and go where you like we are waiting for you',
      image: 'assets/images/finance2.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Swiper(
            itemCount: 2,
            pagination: const SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                color: kSeconderyBlueColor,
                activeColor: kPrimaryColor,
              ),
            ),
            index: currentPage,
            itemBuilder: (context, index) => Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (value) {
                      if (pages.length == value + 1) {
                        isLastPage = true;
                      } else {
                        isLastPage = false;
                      }
                      currentPage = value;
                      setState(() {});
                    },
                    itemCount: pages.length,
                    controller: pageController,
                    itemBuilder: (context, index) => pages[index],
                  ),
                ),
              ],
            ),
          ),
          
        ),
        
          const SizedBox(
            height: 20,
          ),
          CustomButtonWidget(
            label: Text(
              SwiperWidgetState.isLastPage ? 'Get Started' : "Next",
              style: Styles.textStyle16.copyWith(
                color: kWhiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              if (SwiperWidgetState.isLastPage) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ),
                );
              } else {
                SwiperWidgetState.pageController.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
      ],
    );
  }
}
