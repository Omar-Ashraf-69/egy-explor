import 'dart:async';

import 'package:egy_exlpor/core/utils/pref_utils.dart';
import 'package:egy_exlpor/features/auth/presentation/views/login_view.dart';
import 'package:egy_exlpor/features/layout/presentation/views/layout_view.dart';
import 'package:egy_exlpor/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void checkFirstSeen(BuildContext context) async {
  bool seen = PrefUtils.getBool(key: 'seenOnboarding');

  Timer(const Duration(seconds: 2), () async {
    if (seen == true) {
      //context.go(AppRouter.kHomeView);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const LayoutView();
              } else {
                return const LoginView();
              }
            },
          );
        }),
      );
    } else {
      await PrefUtils.setBool(key: 'seenOnboarding', value: true);
      // ignore: use_build_context_synchronously
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (context) => const OnBoardingView(),
      //   ),
      // );
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    }
  });
}
