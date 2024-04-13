
import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/functions/check_on_boarding_showing_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../generated/l10n.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    checkFirstSeen(context);
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
            Text(
              S.of(context).splashTitle,
              style: const TextStyle(
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
