import 'package:ecommarceproject/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData get lightThemeData {
    return ThemeData(
        colorSchemeSeed: AppColors.themColor,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.themColor,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),

        //input dec them

        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          hintStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.themColor,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.themColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.themColor,
              width: 1,
            ),
          ),
        ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.themColor,
            foregroundColor: Colors.white,
            fixedSize: Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            )),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.themColor
        ),
      ),
    );
  }

  static ThemeData get darkThemeData {
    return ThemeData(
        colorSchemeSeed: AppColors.themColor,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.themColor,
        ),
        scaffoldBackgroundColor: Colors.grey,
        brightness: Brightness.dark);
  }
}