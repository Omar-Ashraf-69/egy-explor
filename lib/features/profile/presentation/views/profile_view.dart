import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Image.asset(
              'assets/images/man_icon.png',
            ),
          ),
          title: Text(
            "Omar Ashraf",
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: IconButton(
                onPressed: () {},
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
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.background,
                        width: 3,
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/man_icon.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Omar Ashraf",
                    style: Styles.textStyle18,
                  ),
                  Text(
                    "OmarBondok62@gmail.com",
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
                      text: "Extra Services",
                      function: () {
                        // await Navigator.pushNamed(
                        //   context,
                        //   OrdersScreenFree.routeName,
                        // );
                      },
                    ),
                    const Divider(
                      endIndent: 35,
                      indent: 20,
                    ),
                    CustomListTile(
                      icon: IconlyLight.calendar,
                      text: "Previous trip",
                      function: () async {
                        // await Navigator.pushNamed(
                        //   context,
                        //   WishlistScreen.routName,
                        // );
                      },
                    ),
                    const Divider(
                      endIndent: 35,
                      indent: 20,
                    ),
                    CustomListTile(
                      icon: IconlyLight.setting,
                      text: "Settings",
                      function: () async {
                        // await Navigator.pushNamed(
                        //   context,
                        //   ViewedRecentlyScreen.routName,
                        // );
                      },
                    ),
                    const Divider(
                      endIndent: 35,
                      indent: 20,
                    ),
                    CustomListTile(
                      icon: IconlyLight.message,
                      text: "Contact us",
                      function: () {},
                    ),
                    const Divider(
                      endIndent: 35,
                      indent: 20,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // SwitchListTile(
                    //   secondary: Image.asset(
                    //     AssetsManager.theme,
                    //     height: 30,
                    //   ),
                    //   title: Text(themeProvider.getIsDarkTheme
                    //       ? "Dark mode"
                    //       : "Light mode"),
                    //   value: themeProvider.getIsDarkTheme,
                    //   onChanged: (value) {
                    //     themeProvider.setDarkTheme(themeValue: value);
                    //   },
                    // ),
                  ],
                ),
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
                    "Login",
                    style: TextStyle(
                      color: kWhiteColor,
                    ),
                  ),
                  onPressed: () {
                    // await Navigator.pushNamed(
                    //   context,
                    //   LoginScreen.routName,
                    // );
                    // await MyAppMethods.showErrorORWarningDialog(
                    //     context: context,
                    //     subtitle: "Are you sure?",
                    //     fct: () async {

                    //     },
                    //     isError: false);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.icon,
      required this.text,
      required this.function});
  final String text;
  final IconData icon;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(text),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}

class TitlesTextWidget extends StatelessWidget {
  const TitlesTextWidget({
    Key? key,
    required this.label,
    this.fontSize = 20,
    this.color,
    this.maxLines,
  }) : super(key: key);

  final String label;
  final double fontSize;
  final Color? color;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: maxLines,
      // textAlign: TextAlign.justify,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis),
    );
  }
}
