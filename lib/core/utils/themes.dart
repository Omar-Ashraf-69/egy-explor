import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData darkTheme({required bool isDark}) {
    return ThemeData.dark(
      useMaterial3: true,
    ).copyWith(
      //scaffoldBackgroundColor: kBlackColor,
      appBarTheme: const AppBarTheme(
          // color: kBlackColor,
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
    );
  }

  static ThemeData lightTheme({required bool isDark}) {
    return ThemeData.light(
      useMaterial3: true,
    ).copyWith(
      textTheme: GoogleFonts.montserratTextTheme(
        ThemeData.light().textTheme,
      ),
    );
  }
}
