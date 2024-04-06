import 'package:egy_exlpor/core/managers/get_user_cubit/user_details_cubit.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
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
                    : const TextStyle(color: Colors.black),
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
          backgroundColor: kWhiteColor.withOpacity(0.8),
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
            // NavigationDestination(
            //   label: 'Search',
            //   icon: const Icon(
            //     Icons.search_outlined,
            //   ),
            //   selectedIcon: Icon(
            //     Icons.search_outlined,
            //     color: kPrimaryColor,
            //   ),
            // ),
            // NavigationDestination(
            //   label: 'Profile',
            //   icon:const Icon(Icons.person_outline),
            //   selectedIcon: Icon(
            //     Icons.person_outline,
            //     color: kPrimaryColor,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
