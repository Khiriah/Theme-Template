import 'package:flutter/material.dart';
import 'package:theme_app/core/theme/theme.dart';
import 'element/text_theme.dart';


ThemeData LightThemeData() {
  return ThemeData(
    iconTheme: const IconThemeData(color: darkColor),
    brightness: Brightness
        .light, //Setting the Brightness to light  so that this can be used as Light ThemeData
    scaffoldBackgroundColor: lightColor,

    textTheme: CustomTextTheme
        .textThemeLight, //Setting the Text Theme to LightTextTheme

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: mainColor,
        size: 24,
      ),
      unselectedIconTheme: IconThemeData(
        color: darkColor,
        size: 24,
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: mainColor,
      iconTheme: const IconThemeData(color: darkColor),
      elevation: 0,
      centerTitle: true,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(mainColor),
    )),
  );
}
