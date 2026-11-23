
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primary = Color(0xFF1748E8);
  static const primaryDark = Color(0xFF102D83);

  static const background = Color(0xFFF4F7FC);
  static const surface = Colors.white;

  static const textPrimary = Color(0xFF102D67);
  static const textSecondary = Color(0xFF8290AA);

  static const orange = Color(0xFFFF9800);
  static const red = Color(0xFFEF383D);
  static const green = Color(0xFF20A56B);

  static const lightBlue = Color(0xFFEAF1FF);
  static const lightPink = Color(0xFFFFF0F1);
  static const lightOrange = Color(0xFFFFF3E9);

  static const border = Color(0xFFE5EAF2);
}

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Roboto',
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
    );
  }
}
