import 'package:egy_exlpor/core/managers/get_user_cubit/user_details_cubit.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/features/explore/presentation/views/explore_view.dart';
import 'package:egy_exlpor/features/home/presentation/views/home_view.dart';
import 'package:egy_exlpor/features/profile/presentation/views/profile_view.dart';
import 'package:egy_exlpor/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class LayoutViewBody extends StatefulWidget {
  const LayoutViewBody({super.key});

  @override
  State<LayoutViewBody> createState() => _LayoutViewBodyState();
}

class _LayoutViewBodyState extends State<LayoutViewBody> {
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    // Provider.of<UserProvider>(context, listen: false).getUserDetails();
    super.initState();
    BlocProvider.of<UserCubit>(context).getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: pageController,
        children: const [
          HomeView(),
          ExploreView(),
          ProfileView(),
          // SearchScreen(),
          // ProfileScreen(),
        ],
        onPageChanged: (value) {
          currentIndex = value;
          setState(() {});
        },
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.selected)
                    ? const TextStyle(
                        color: kPrimaryColor,
                      )
                    : const TextStyle(),
          ),
        ),
        child: NavigationBar(
          selectedIndex: currentIndex,
          elevation: 0,
          onDestinationSelected: (value) {
            currentIndex = value;
            pageController.jumpToPage(currentIndex);
            setState(() {});
          },
          indicatorColor: kSeconderyBlueColor,
          surfaceTintColor: kPrimaryColor,
          destinations: [
            NavigationDestination(
              label: S.of(context).home,
              icon: const Icon(Icons.home),
              selectedIcon: const Icon(
                Icons.home,
                color: kPrimaryColor,
              ),
            ),
            const NavigationDestination(
              label: "Explore",
              icon: Icon(
                Icons.explore_outlined,
              ),
              selectedIcon: Icon(
                Icons.explore,
                color: kPrimaryColor,
              ),
            ),
            NavigationDestination(
              label: S.of(context).profile,
              icon: const Icon(
                IconlyLight.profile,
              ),
              selectedIcon: const Icon(
                IconlyLight.profile,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
