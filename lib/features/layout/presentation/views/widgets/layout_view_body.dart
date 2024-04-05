import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/features/home/presentation/views/home_view.dart';
import 'package:egy_exlpor/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';

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
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        elevation: 0,
        onDestinationSelected: (value) {
          currentIndex = value;
          pageController.jumpToPage(currentIndex);
          setState(() {});
        },
        indicatorColor: kPinkColor,
        backgroundColor: kWhiteColor.withOpacity(0.8),
        surfaceTintColor: kPrimaryColor,
        destinations: const [
          NavigationDestination(
            label: 'Home',
            icon: Icon(Icons.home),
            selectedIcon: Icon(
              Icons.home,
              color: kPrimaryColor,
            ),
          ),
          NavigationDestination(
            label: 'Add',
            icon: Icon(Icons.add_circle_outline),
            selectedIcon: Icon(
              Icons.add_circle_outline,
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
    );
  }
}
