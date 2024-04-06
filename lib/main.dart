import 'package:egy_exlpor/core/managers/app_them_cubit/app_them_cubit.dart';
import 'package:egy_exlpor/core/managers/get_user_cubit/user_details_cubit.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/features/splash/presentation/views/splash_screen.dart';
import 'package:egy_exlpor/firebase_options.dart';
import 'package:egy_exlpor/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDark) {
          return MaterialApp(
            // routerConfig: AppRouter.router,
            title: "Egy Exlpor",
            debugShowCheckedModeBanner: false,

            darkTheme: ThemeData.dark(
              useMaterial3: true,
            ).copyWith(
              scaffoldBackgroundColor: kBlackColor,
              appBarTheme: const AppBarTheme(
                color: kBlackColor,
              ),
              textTheme: GoogleFonts.montserratTextTheme(
                ThemeData.dark().textTheme,
              ),
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              inputDecorationTheme: InputDecorationTheme(
                fillColor: isDark ? kTextFieldColor : kWhiteColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            theme: ThemeData.light(
              useMaterial3: true,
            ).copyWith(
              textTheme: GoogleFonts.montserratTextTheme(
                ThemeData.light().textTheme,
              ),
            ),
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

            home: const SplashView(),
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
}
