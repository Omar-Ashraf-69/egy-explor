import 'package:cached_network_image/cached_network_image.dart';
import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/custom_icon_button.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/notification/presentation/view/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../core/managers/get_user_cubit/user_details_cubit.dart';

PreferredSizeWidget exploreViewAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
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
                child: BlocProvider.of<UserCubit>(context)
                        .user!
                        .profilePic
                        .isNotEmpty
                    ? CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey,
                        onBackgroundImageError: (exception, stackTrace) =>
                            const Icon(Icons.error),
                        backgroundImage: CachedNetworkImageProvider(
                          BlocProvider.of<UserCubit>(context).user!.profilePic,
                        ),
                      )
                    : Image.asset(
                        AssetsData.profilePic,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 10),
                child: Text(
                  BlocProvider.of<UserCubit>(context).user!.userName,
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                    color: kBlackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    actions: const [
      Padding(
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
