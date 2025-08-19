import 'package:iti_project/core/utiles/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

abstract class ThemeEvent {
  const ThemeEvent();
}

class ToggleTheme extends ThemeEvent {}

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(_lightTheme) {
    on<ToggleTheme>((event, emit) {
      if (state.brightness == Brightness.light) {
        emit(_darkTheme);
      } else {
        emit(_lightTheme);
      }
    });
  }
  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.blue,
    scaffoldBackgroundColor: AppColors.white,
    cardColor: AppColors.lightGray,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.blue,
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: AppColors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue,
        foregroundColor: AppColors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.blue),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.blue,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );

  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkBlue,
    scaffoldBackgroundColor: AppColors.black,
    cardColor: AppColors.darkGray,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBlue,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: AppColors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkBlue,
        foregroundColor: AppColors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.lightBlue),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBlue,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      filled: true,
      fillColor: AppColors.darkGray,
      hintStyle: TextStyle(color: AppColors.white),
    ),
  );
}
