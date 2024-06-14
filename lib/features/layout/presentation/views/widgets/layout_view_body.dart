import 'package:egy_exlpor/core/managers/get_user_cubit/user_details_cubit.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/features/explore/presentation/views/explore_view.dart';
import 'package:egy_exlpor/features/favorites/presentation/views/favorites_view.dart';
import 'package:egy_exlpor/features/home/presentation/views/home_view.dart';
import 'package:egy_exlpor/features/profile/presentation/views/profile_view.dart';
import 'package:egy_exlpor/features/reveal_monuments/presentation/views/reveal_view.dart';
import 'package:egy_exlpor/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:ionicons/ionicons.dart';

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
          RevealView(),
          FavoritesView(),
          ProfileView(),
        ],
        onPageChanged: (value) {
          currentIndex = value;
          setState(() {});
        },
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (Set<WidgetState> states) => states.contains(WidgetState.selected)
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
            const NavigationDestination(
              label: "Reveal",
              icon: Icon(
                Icons.camera,
                size: 40,
              ),
              selectedIcon: Icon(
                Icons.camera,
                size: 40,
                color: kPrimaryColor,
              ),
            ),
            const NavigationDestination(
              label: "Favorites",
              icon: Icon(
                Ionicons.heart_outline,
              ),
              selectedIcon: Icon(
                Ionicons.heart_outline,
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
