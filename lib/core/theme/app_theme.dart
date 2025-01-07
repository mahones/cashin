import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.accent_color,
    ),

    textTheme: TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.text,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.text,
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: 16,
        color: AppColors.text,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        color: AppColors.text,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        color: AppColors.text,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 13,
        color: AppColors.text_second,
      ),
    ),            

  );
  

}
