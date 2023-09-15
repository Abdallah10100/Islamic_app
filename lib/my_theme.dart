import 'package:flutter/material.dart';

class MyTheme {
  /// colors,light mode,dark mode
  static Color primaryLight = Color(0xffB7935F);
  static Color blackColor = Color(0xff242424);
  static Color whiteColor = Colors.white;

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: blackColor,
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blackColor,
      unselectedItemColor: whiteColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: blackColor),
      titleMedium: TextStyle(
          fontSize: 26, fontWeight: FontWeight.w500, color: blackColor),
      titleSmall: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w300, color: blackColor),
    ),
  );
}
