import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodAppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodySmall: GoogleFonts.openSans(
      // bodyText1 deprecated
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.openSans(
      // headline6 deprecated
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineLarge: GoogleFonts.openSans(
      // headline1 deprecated
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.openSans(
      // headline2 deprecated
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headlineSmall: GoogleFonts.openSans(
      // headline3 deprecated
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodySmall: GoogleFonts.openSans(
      // bodyText1 deprecated
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.openSans(
      // headline6 deprecated
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineLarge: GoogleFonts.openSans(
      // headline1 deprecated
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: GoogleFonts.openSans(
      // headline2 deprecated
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headlineSmall: GoogleFonts.openSans(
      // headline3 deprecated
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) => Colors.black,
        ),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: lightTextTheme,
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Color(0xFF303030),
          ),
          foregroundColor: MaterialStatePropertyAll(
            Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF282828),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: darkTextTheme,
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Color(0xFFFFFFFF),
          ),
          foregroundColor: MaterialStatePropertyAll(
            Color(0xFF303030),
          ),
        ),
      ),
    );
  }
}
