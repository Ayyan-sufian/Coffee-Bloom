import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF6A4616);
  static const Color secColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF040404);
  static const Color iconColor = Color(0xFFD2C7B9);
  static const Color greyColor = Color(0xFF757575);
  static const Color errorColor = Color(0xFFDF1515);
  static const Color successColor = Color(0xFF53BD30);
  static const Color chipColor = Color(0xFFD9D9D9);
  static const Color cardColor = Color(0xFFFBFBFB);
  static const Color textWhiteColor = Color(0xFFF6F6F6);
  static const Color textGreyColor = Color(0xFFCECECE);
  static const Color textBlackColor = Color(0xFF000000);
  static const Color transparentColor = Colors.transparent;
  static const Color yellowColor = Colors.amber;


  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppTheme.secColor,
    ),
    scaffoldBackgroundColor: AppTheme.secColor,
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.nunito(
        fontSize: 36,
        color: AppTheme.secColor,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: GoogleFonts.nunito(
        fontSize: 28,
        color: AppTheme.textWhiteColor,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.nunito(
        fontSize: 20,
        color: AppTheme.textGreyColor,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: GoogleFonts.nunito(
        fontSize: 16,
        color: AppTheme.textBlackColor,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.nunito(
        fontSize: 14,
        color: AppTheme.textBlackColor,
        fontWeight: FontWeight.w300,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppTheme.primaryColor,
      foregroundColor: AppTheme.secColor
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryColor,
          foregroundColor: AppTheme.secColor,
      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppTheme.greyColor.withAlpha(60),
      hintStyle: TextStyle(color: AppTheme.primaryColor),
      errorStyle: TextStyle(
        color: AppTheme.errorColor
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppTheme.errorColor),
        borderRadius: BorderRadius.circular(10),
      ),
    )
  );
}