import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // --- Dark Theme Text Styles ---
  static TextTheme get darkTextTheme {
    return TextTheme(
      // Display/Headlines using Newsreader
      displayLarge: GoogleFonts.newsreader(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: AppColors.darkOnSurface,
        letterSpacing: -0.25,
      ),
      displayMedium: GoogleFonts.newsreader(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: AppColors.darkOnSurface,
      ),
      displaySmall: GoogleFonts.newsreader(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: AppColors.darkOnSurface,
      ),
      headlineLarge: GoogleFonts.newsreader(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: AppColors.darkOnSurface,
      ),
      headlineMedium: GoogleFonts.newsreader(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: AppColors.darkOnSurface,
      ),
      headlineSmall: GoogleFonts.newsreader(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppColors.darkOnSurface,
      ),

      // Body/Titles/Labels using Manrope
      titleLarge: GoogleFonts.manrope(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: AppColors.darkOnSurface,
        letterSpacing: 0.15,
      ),
      titleMedium: GoogleFonts.manrope(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.darkOnSurface,
        letterSpacing: 0.15,
      ),
      titleSmall: GoogleFonts.manrope(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.darkOnSurface,
        letterSpacing: 0.1,
      ),
      bodyLarge: GoogleFonts.manrope(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.darkOnSurface,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.manrope(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.darkOnSurface,
        letterSpacing: 0.25,
      ),
      bodySmall: GoogleFonts.manrope(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.darkOnSurface,
        letterSpacing: 0.4,
      ),
      labelLarge: GoogleFonts.manrope(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.darkOnSurface,
        letterSpacing: 1.25, // Substantial letter spacing for editorial look
      ),
      labelSmall: GoogleFonts.manrope(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: AppColors.darkOnSurface,
        letterSpacing: 1.5,
      ),
    );
  }

  // --- Light Theme Text Styles ---
  static TextTheme get lightTextTheme {
    return TextTheme(
      displayLarge: GoogleFonts.newsreader(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: AppColors.lightOnSurface,
        letterSpacing: -0.25,
      ),
      displayMedium: GoogleFonts.newsreader(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: AppColors.lightOnSurface,
      ),
      displaySmall: GoogleFonts.newsreader(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: AppColors.lightOnSurface,
      ),
      headlineLarge: GoogleFonts.newsreader(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: AppColors.lightOnSurface,
      ),
      headlineMedium: GoogleFonts.newsreader(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: AppColors.lightOnSurface,
      ),
      headlineSmall: GoogleFonts.newsreader(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppColors.lightOnSurface,
      ),

      titleLarge: GoogleFonts.manrope(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: AppColors.lightOnSurface,
        letterSpacing: 0.15,
      ),
      titleMedium: GoogleFonts.manrope(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.lightOnSurface,
        letterSpacing: 0.15,
      ),
      titleSmall: GoogleFonts.manrope(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.lightOnSurface,
        letterSpacing: 0.1,
      ),
      bodyLarge: GoogleFonts.manrope(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.lightOnSurface,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.manrope(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.lightOnSurface,
        letterSpacing: 0.25,
      ),
      bodySmall: GoogleFonts.manrope(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.lightOnSurface,
        letterSpacing: 0.4,
      ),
      labelLarge: GoogleFonts.manrope(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.lightOnSurface,
        letterSpacing: 1.25,
      ),
      labelSmall: GoogleFonts.manrope(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: AppColors.lightOnSurface,
        letterSpacing: 1.5,
      ),
    );
  }
}
