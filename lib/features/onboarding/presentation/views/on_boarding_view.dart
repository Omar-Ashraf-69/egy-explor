import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/onboarding/presentation/views/widgets/on_boarding_view_body.dart';
import 'package:egy_exlpor/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

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
            child: Text(
              S.of(context).skip,
              style: Styles.textStyle16.copyWith(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: const OnBoardingViewBody(),
    );
  }
}

