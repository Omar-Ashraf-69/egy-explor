import 'package:egy_exlpor/core/managers/get_user_cubit/user_details_cubit.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/core/utils/custom_icon_button.dart';
import 'package:egy_exlpor/features/home/presentation/views/widgets/best_destinations_widget.dart';
import 'package:egy_exlpor/features/home/presentation/views/widgets/recommended_places.dart';
import 'package:egy_exlpor/features/notification/presentation/view/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 59.0,
          bottom: 60,
          left: 14,
          right: 14,
        ),
        child: Column(
          children: [
            SizedBox(
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
                      BlocProvider.of<UserCubit>(context).user?.userName ??
                          'Back',
                      style: Styles.textStyle18,
                    ),
                  ],
                ),
                const Spacer(),
                const CustomIconButton(
                  icon: Icon(Ionicons.search_outline),
                  route: NotificationView.routeName,
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
            ),
            // LOCATION CARD
            // const LocationCard(),
            // const SizedBox(
            //   height: 15,
            // ),
            // const TouristPlaces(),
            // CATEGORIES
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommendation",
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                    onTap: () {},
                    child: Text(
                      "View All",
                      style: Styles.textStyle16.copyWith(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ))
              ],
            ),
            const RecommendedPlaces(),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Best Destinations",
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "View All",
                    style: Styles.textStyle16.copyWith(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const BestDestinationsWidget(),
          ],
        ),
      ),
    );
  }
}
