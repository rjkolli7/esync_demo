import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF060150),
  secondaryHeaderColor: const Color(0xFF790605),
  textButtonTheme: TextButtonThemeData(
    style:
        TextButton.styleFrom(textStyle: const TextStyle(color: Colors.black)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xFF060150),
      onPrimary: const Color(0xFF060150),
      textStyle: const TextStyle(color: Colors.white),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xFF060150),
      textStyle: const TextStyle(color: Colors.white),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF060150),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black),
    bodySmall: TextStyle(color: Colors.black),
    titleLarge: TextStyle(color: Colors.black),
    titleMedium: TextStyle(color: Colors.black),
    titleSmall: TextStyle(color: Colors.black),
    labelLarge: TextStyle(color: Colors.black),
    labelMedium: TextStyle(color: Colors.black),
    labelSmall: TextStyle(color: Colors.black),
    displayLarge: TextStyle(color: Colors.black),
    headlineLarge: TextStyle(color: Colors.black),
    headlineMedium: TextStyle(color: Colors.black),
    headlineSmall: TextStyle(color: Colors.black),
  ),
  hintColor: Colors.black.withOpacity(0.5),
  scaffoldBackgroundColor: Colors.white,
);

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.orange,
  secondaryHeaderColor: Colors.yellow,
  textButtonTheme: TextButtonThemeData(
    style:
        TextButton.styleFrom(textStyle: const TextStyle(color: Colors.black)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xFF060150),
      onPrimary: const Color(0xFF060150),
      textStyle: const TextStyle(color: Colors.white),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xFF060150),
      textStyle: const TextStyle(color: Colors.white),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF060150),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
    bodySmall: TextStyle(color: Colors.white),
    titleLarge: TextStyle(color: Colors.white),
    titleMedium: TextStyle(color: Colors.white),
    titleSmall: TextStyle(color: Colors.white),
    labelLarge: TextStyle(color: Colors.white),
    labelMedium: TextStyle(color: Colors.white),
    labelSmall: TextStyle(color: Colors.white),
    displayLarge: TextStyle(color: Colors.white),
    headlineLarge: TextStyle(color: Colors.white),
    headlineMedium: TextStyle(color: Colors.white),
    headlineSmall: TextStyle(color: Colors.white),
  ),
  hintColor: Colors.white.withOpacity(0.5),
  scaffoldBackgroundColor: const Color(0XFF303030),
);
