import 'package:flutter/material.dart';
import 'package:grocesry_app/core/app_colors.dart';

class AppStyles {
  static TextStyle headingLarge = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary
  );

   static TextStyle headingMedium = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );


  static TextStyle bodyLarge = const TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyMedium = const TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static TextStyle hint = const TextStyle(
    fontSize: 14,
    color: AppColors.textHint,
  );


  static TextStyle buttonText = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );


  static TextStyle error = const TextStyle(
    fontSize: 14,
    color: AppColors.error,
  );
}