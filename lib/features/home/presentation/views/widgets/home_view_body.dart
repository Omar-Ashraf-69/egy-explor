import 'package:egy_exlpor/core/managers/get_user_cubit/user_details_cubit.dart';
import 'package:egy_exlpor/core/managers/get_user_cubit/user_details_state.dart';
import 'package:egy_exlpor/features/home/presentation/views/widgets/best_destinations_widget.dart';
import 'package:egy_exlpor/features/home/presentation/views/widgets/home_view_appbar.dart';
import 'package:egy_exlpor/features/home/presentation/views/widgets/recommended_places.dart';
import 'package:egy_exlpor/core/widgets/section_header.dart';
import 'package:egy_exlpor/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(
                top: 59.0,
                bottom: 60,
                left: 14,
                right: 14,
              ),
              child: Column(
                children: [
                  HomeViewAppBar(),
                  SizedBox(height: 10),
                  SectionHeader(
                    title: S.of(context).hiddenGems,
                    isViewAll: false,
                  ),
                  HiddenGems(),
                  SizedBox(height: 5),
                  SectionHeader(
                    title: S.of(context).hotSpots,
                    isViewAll: false,
                  ),
                  SizedBox(height: 5),
                  BestDestinationsWidget(),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
