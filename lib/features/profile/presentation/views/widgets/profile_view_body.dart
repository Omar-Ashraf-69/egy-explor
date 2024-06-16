import 'package:cached_network_image/cached_network_image.dart';
import 'package:egy_exlpor/core/managers/app_them_cubit/app_them_cubit.dart';
import 'package:egy_exlpor/core/managers/get_user_cubit/user_details_cubit.dart';
import 'package:egy_exlpor/core/managers/get_user_cubit/user_details_state.dart';
import 'package:egy_exlpor/core/services/auth.dart';
import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/features/profile/features/edit_user/presentation/views/edit_user_view.dart';
import 'package:egy_exlpor/features/extra_services/presentation/views/extra_service.dart';
import 'package:egy_exlpor/features/profile/presentation/views/widgets/contact_us_view.dart';
import 'package:egy_exlpor/features/profile/presentation/views/widgets/custom_list_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../../generated/l10n.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = BlocProvider.of<ThemeCubit>(context);

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          return Scaffold(
              appBar: AppBar(
                title: Row(
                  children: [
                    Text(
                      S.of(context).welcome,
                      style: Styles.textStyle16,
                    ),
                    Text(
                      BlocProvider.of<UserCubit>(context).user!.userName,
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const EditProfileView();
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        IconlyLight.edit,
                      ),
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        state.user.profilePic.isNotEmpty
                            ? CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey,
                                onBackgroundImageError:
                                    (exception, stackTrace) =>
                                        const Icon(Icons.error),
                                backgroundImage: CachedNetworkImageProvider(
                                  state.user.profilePic,
                                ),
                              )
                            : Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).cardColor,
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    width: 3,
                                  ),
                                  image: const DecorationImage(
                                    image: AssetImage(AssetsData.manPic),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          BlocProvider.of<UserCubit>(context).user!.userName,
                          style: Styles.textStyle18,
                        ),
                        Text(
                          BlocProvider.of<UserCubit>(context).user!.email,
                          style: Styles.textStyle16.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomListTile(
                            icon: IconlyLight.closeSquare,
                            text: S.of(context).extraServices,
                            function: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ExtraServiceView(),
                                ),
                              );
                            },
                          ),
                          const Divider(
                            endIndent: 35,
                            indent: 20,
                          ),
                          // CustomListTile(
                          //   icon: IconlyLight.calendar,
                          //   text: S.of(context).previousTrip,
                          //   function: () async {
                          //     // await Navigator.pushNamed(
                          //     //   context,
                          //     //   WishlistScreen.routName,
                          //     // );
                          //   },
                          // ),
                          // const Divider(
                          //   endIndent: 35,
                          //   indent: 20,
                          // ),
                          CustomListTile(
                            icon: IconlyLight.setting,
                            text: S.of(context).settings,
                            function: () async {},
                          ),
                          const Divider(
                            endIndent: 35,
                            indent: 20,
                          ),
                          CustomListTile(
                            icon: IconlyLight.message,
                            text: S.of(context).contactUs,
                            function: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ContactUsView(),
                                ),
                              );
                            },
                          ),
                          const Divider(
                            endIndent: 35,
                            indent: 20,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BlocBuilder<ThemeCubit, bool>(
                            builder: (context, state) {
                              return SwitchListTile(
                                secondary: Image.asset(
                                  AssetsData.theme,
                                  height: 30,
                                ),
                                title: Text(themeProvider.getIsDarkTheme
                                    ? "Dark mode"
                                    : "Light mode"),
                                value: themeProvider.getIsDarkTheme,
                                onChanged: (value) {
                                  themeProvider.setDarkTheme(themeValue: value);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                          ),
                        ),
                        icon: Icon(
                          Icons.login,
                          color: kWhiteColor,
                        ),
                        label: Text(
                          S.of(context).logout,
                          style: TextStyle(
                            color: kWhiteColor,
                          ),
                        ),
                        onPressed: () async {
                          await Authentication().signOut(context);
                        },
                      ),
                    ),
                  ],
                ),
              ));
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
