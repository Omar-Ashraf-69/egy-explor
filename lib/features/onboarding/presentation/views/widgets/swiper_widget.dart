import 'package:card_swiper/card_swiper.dart';
import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/custom_button_widget.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/auth/presentation/views/login_view.dart';
import 'package:egy_exlpor/features/onboarding/presentation/views/widgets/on_boarding_widget.dart';
import 'package:egy_exlpor/generated/l10n.dart';
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

  @override
  Widget build(BuildContext context) {
    List<OnBoardingPageWidget> pages = [
      OnBoardingPageWidget(
        title: S.of(context).onBoardingPage1Title,
        suffixText: S.of(context).onBoardingPage1Suffix,
        subTitle: S.of(context).onBoardingPage1subTitle,
        image: AssetsData.onboarding1,
      ),
      OnBoardingPageWidget(
        title: S.of(context).onBoardingPage2Title,
        suffixText: S.of(context).onBoardingPage2Suffix,
        subTitle: S.of(context).onBoardingPage2subTitle,
        image: AssetsData.onboarding2,
      ),
    ];
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: CustomButtonWidget(
            label: Text(
              SwiperWidgetState.isLastPage
                  ? S.of(context).getStared
                  : S.of(context).next,
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
        ),
      ],
    );
  }
}
