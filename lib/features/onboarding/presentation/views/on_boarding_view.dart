import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/features/onboarding/presentation/views/widgets/on_boarding_widget.dart';
import 'package:egy_exlpor/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController pageController = PageController();
  int currentPage = 0;
  bool isLastPage = false;
  List<OnBoardingPageWidget> pages = const [
    OnBoardingPageWidget(
      title: 'Title1',
      subTitle: 'SubTitle1',
      image: 'assets/images/finance1.png',
    ),
    OnBoardingPageWidget(
      title: 'Title2',
      subTitle: 'SubTitle2',
      image: 'assets/images/finance2.png',
    ),
    OnBoardingPageWidget(
      title: 'Title3',
      subTitle: 'SubTitle3',
      image: 'assets/images/finance3.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                // context.go(AppRouter.kHomeView);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                    (route) => false);
              },
              child: const Text('Skip')),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  if (pages.length == value + 1) {
                    isLastPage = true;
                  }
                  currentPage = value;
                  setState(() {});
                },
                itemCount: pages.length,
                controller: pageController,
                itemBuilder: (context, index) => pages[index],
              ),
            ),
            Row(
              children: [
                Text(
                  '${currentPage + 1}/${pages.length}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryPurbleColor,
                  ),
                ),
                const Spacer(),
                isLastPage
                    ? ElevatedButton(
                        onPressed: () {
                          //context.go(AppRouter.kHomeView);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginView()),
                              (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: kPrimaryPurbleColor,
                        ),
                        child: const Text(
                          "Let's Start",
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_circle_right_sharp,
                          size: 50,
                          color: kPrimaryPurbleColor,
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
