import 'dart:ui';

import 'package:theme_app/core/theme/dark_theme.dart';
import 'package:theme_app/core/theme/light_theme.dart';

const Color mainColor = Color(0xFFFF5252);
const Color lightColor = Color(0xFFFFFFFF);
const Color darkColor = Color(0xFF262626);


class CustomTheme {
  static final lightTheme = LightThemeData();
  static final darkTheme = DarkThemeData();
}
