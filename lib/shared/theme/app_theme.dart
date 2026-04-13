import 'package:flutter/material.dart';

abstract class AppColors {
  static const ink = Color(0xFF1C1C1E);
  static const violet = Color(0xFF8B7FEC);
  static const violetSoft = Color(0x0F8B7FEC); // rgba(139,127,236,.06)
  static const green = Color(0xFF30D158);
  static const red = Color(0xFFFF3B30);
  static const background = Color(0xFFFAFAF8);
  static const white = Color(0xFFFFFFFF);
  static const grey = Color(0xFF8E8E93);
  static const greyLight = Color(0xFFF2F2F7);
}

abstract class AppTheme {
  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.light(
          primary: AppColors.violet,
          secondary: AppColors.violet,
          error: AppColors.red,
          surface: AppColors.white,
        ),
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'DMSerifDisplay',
            fontSize: 28,
            fontWeight: FontWeight.w400,
            color: AppColors.ink,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.ink,
          ),
          titleLarge: TextStyle(
            fontFamily: 'DMSerifDisplay',
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: AppColors.ink,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.ink,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.ink,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
          labelLarge: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.ink,
          elevation: 0,
        ),
      );
}
