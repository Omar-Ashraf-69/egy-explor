
import 'package:egy_exlpor/core/managers/get_user_cubit/user_details_cubit.dart';
import 'package:egy_exlpor/core/utils/custom_icon_button.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/notification/presentation/view/notification_view.dart';
import 'package:egy_exlpor/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Good Morning,",
              style: Styles.textStyle16,
            ),
            Text(
              BlocProvider.of<UserCubit>(context).user!.userName,
              style: Styles.textStyle18,
            ),
          ],
        ),
        const Spacer(),
        const CustomIconButton(
          icon: Icon(Ionicons.search_outline),
          route: SearchView.routeName,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 12),
          child: CustomIconButton(
            icon: Icon(
              Ionicons.notifications_outline,
            ),
            route: NotificationView.routeName,
          ),
        ),
      ]),
    );
  }
}
