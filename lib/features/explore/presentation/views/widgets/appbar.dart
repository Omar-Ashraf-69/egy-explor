import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/custom_icon_button.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/notification/presentation/view/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

PreferredSizeWidget exploreViewAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
        elevation: 0, // Remove shadow

    title: Row(

      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: Image.asset(
                  AssetsData.profilePic,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 8),
                child: Text(
                  "Omar Ashraf",
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    actions: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: CustomIconButton(
          icon: Icon(
            Ionicons.notifications_outline,
          ),
          route: NotificationView.routeName,
        ),
      ),
    ],
  );
}
