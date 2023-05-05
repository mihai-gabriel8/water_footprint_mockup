import 'package:flutter/material.dart';

part 'app_constants.dart';

class AppTheme {
  AppTheme._();

  static const fontName = 'Poppins';

  static final themeData = {
    AppThemeMode.lightTheme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      // Colors.grey[100]
      // primarySwatch
      primaryColor: kPrimaryColor,
      cardColor: Colors.white,
      fontFamily: fontName,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
        foregroundColor: Colors.black,
      ),

      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          minimumSize: MaterialStateProperty.all(const Size(60, 30)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: AlignmentDirectional.centerStart,
        ),
      ),
      textTheme: const TextTheme(
          displayMedium: TextStyle(
            fontSize: 22,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
          ),
          headlineSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: kSecondaryColor),
    )
  };
}

enum AppThemeMode {
  lightTheme,
}
