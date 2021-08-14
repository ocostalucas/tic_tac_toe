import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/shared/core/app_colors.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
        fontFamily: 'RammettoOne-Regular',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: AppColors.primary,
        colorScheme: ColorScheme.light(primary: AppColors.primary),
        scaffoldBackgroundColor: AppColors.primary,
      );
}
