import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_app/core/theme/theme.dart';

// Custom Text Styles Class For Both Dark and Light Theme
class CustomTextTheme {
  //! Default Font is GoogleFonts.Ubuntu You can change it as your Need

  static const textColorLight =
      darkColor; // Light Theme Default Text Color
  static const textColorDark =
      lightColor; // Light Theme Default Text Color

  static TextTheme get textThemeLight {
    return textTheme(textColor: textColorLight);
  }

  static TextTheme get textThemeDark {
    return textTheme(textColor: textColorDark);
  }

  // Private Method For Text Theme so that we can change the vale for Both Dark And Light Theme
  static TextTheme textTheme({required Color textColor}) {
    const FontWeight light = FontWeight.w300;
    const FontWeight medium = FontWeight.w500;
    const FontWeight regular = FontWeight.w400;

    return TextTheme(
      headline1: GoogleFonts.ubuntu(
        fontSize: 96,
        color: textColor,
        fontWeight: light,
        letterSpacing: -1.5,
      ),
      headline2: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 60,
        fontWeight: light,
        letterSpacing: -0.5,
      ),
      headline3: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 48,
        fontWeight: regular,
        letterSpacing: 0.0,
      ),
      headline4: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 34,
        fontWeight: regular,
        letterSpacing: 0.25,
      ),
      headline5: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 24,
        fontWeight: regular,
        letterSpacing: 0.0,
      ),
      headline6: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 20,
        fontWeight: medium,
        letterSpacing: 0.15,
      ),
      bodyText1: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 16,
        fontWeight: regular,
        letterSpacing: 0.5,
      ),
      bodyText2: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 14,
        fontWeight: regular,
        letterSpacing: 0.25,
      ),
      button: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 14,
        fontWeight: medium,
        letterSpacing: 1.25,
      ),
      caption: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 12,
        fontWeight: regular,
        letterSpacing: 0.4,
      ),
      overline: GoogleFonts.ubuntu(
        color: textColor,
        fontSize: 10,
        fontWeight: regular,
        letterSpacing: 1.5,
      ),
    );
  }
}
