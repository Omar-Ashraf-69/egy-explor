import 'dart:async';

import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/features/auth/presentation/views/login_view.dart';
import 'package:egy_exlpor/features/home/presentation/views/home_view.dart';
import 'package:egy_exlpor/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    _checkFirstSeen();
  }

  void _checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seenOnboarding') ?? false);

    Timer(const Duration(seconds: 2), () async {
      if (seen == true) {
        //context.go(AppRouter.kHomeView);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const HomeView();
                } else {
                  return const LoginView();
                }
              },
            );
          }),
        );
      } else {
        await prefs.setBool('seenOnboarding', true);
        //context.go(AppRouter.kOnBoardingView);

        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OnBoardingView()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsData.logo,
              colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Egy Exlpor',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: kPrimaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
