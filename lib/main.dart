import 'package:egy_exlpor/core/helpers/size_config.dart';
import 'package:egy_exlpor/core/managers/app_them_cubit/app_them_cubit.dart';
import 'package:egy_exlpor/core/managers/favorites_cubit/cubit/favorities_cubit.dart';
import 'package:egy_exlpor/core/managers/get_user_cubit/user_details_cubit.dart';
import 'package:egy_exlpor/core/utils/pref_utils.dart';
import 'package:egy_exlpor/core/utils/themes.dart';
import 'package:egy_exlpor/features/extra_services/weather/presentation/managers/weather_cubit/weather_cubit.dart';
import 'package:egy_exlpor/features/reveal_monuments/presentation/views/image_cubit/image_cubit.dart';
import 'package:egy_exlpor/features/splash/presentation/views/splash_screen.dart';
import 'package:egy_exlpor/firebase_options.dart';
import 'package:egy_exlpor/generated/l10n.dart';
import 'package:egy_exlpor/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/single_child_widget.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    PrefUtils.init();

    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providersList,
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDark) {
          return MaterialApp(
            title: "Egy Exlpor",
            debugShowCheckedModeBanner: false,
            darkTheme: Themes.darkTheme(isDark: isDark),
            theme: Themes.lightTheme(isDark: isDark),
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            routes: routes,
            onGenerateRoute: generateRoutes,
            // home: const SplashView(),
            home: Builder(
              builder: (context) {
                SizeConfig.init(context);
                return const SplashView();
              },
            ),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (locale != null &&
                    supportedLocale.languageCode == locale.languageCode) {
                  return locale;
                }
              }
              return supportedLocales.first;
            },
          );
        },
      ),
    );
  }

  List<SingleChildWidget> get providersList {
    return [
      BlocProvider(
        create: (context) => UserCubit(),
      ),
      BlocProvider(
        create: (context) => ThemeCubit(),
      ),
      BlocProvider(
        create: (context) => ImageCubit(),
      ),
      BlocProvider(create: (context) => WeatherCubit()),
      BlocProvider(create: (context) => FavoritesCubit()),
    ];
  }
}
