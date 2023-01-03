import 'package:flutter/material.dart';
import 'package:theme_app/core/theme/theme.dart';
import 'element/text_theme.dart';

// ignore: non_constant_identifier_names
ThemeData DarkThemeData() {
  return ThemeData(
    brightness: Brightness
        .dark, //Setting the Brightness to Dark  so that this can be used as Dark ThemeData
    scaffoldBackgroundColor: darkColor,
    textTheme:
        CustomTextTheme.textThemeDark, //Setting the Text Theme to DarkTextTheme
    appBarTheme: const AppBarTheme(centerTitle: true),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color:  mainColor ,
        size: 24,
      ),
      unselectedIconTheme: IconThemeData(
        color:lightColor,
        size: 24,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(mainColor),
    )),
    //! You Can Set All Your Custom Dark Theme Here
  );
}
