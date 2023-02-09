// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  NavigatorState get navigator => Navigator.of(this);

  void showSnackBar(Widget snackBar) {
    ScaffoldMessenger.of(this).removeCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        padding: const EdgeInsets.only(top: 20),
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: snackBar,
      ),
    );
  }
}

extension ContextThemeColors on BuildContext {
  Color get textColor => Theme.of(this).textTheme.bodyText1!.color!;

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get accentColor => Theme.of(this).colorScheme.secondary;

  Color get displayColor => Theme.of(this).textTheme.headline3!.color!;

  Color get hintColor => Theme.of(this).hintColor;

  Color get disableColor => Theme.of(this).disabledColor;

  Color get backgroundColor => Theme.of(this).backgroundColor;

  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
}

extension ContextTextStylesX on BuildContext {
  TextStyle get caption => Theme.of(this).textTheme.caption!;

  TextStyle get bodyText1 => Theme.of(this).textTheme.bodyText1!;

  TextStyle get bodyText2 => Theme.of(this).textTheme.bodyText2!;

  TextStyle get subtitle1 => Theme.of(this).textTheme.subtitle1!;

  TextStyle get subtitle2 => Theme.of(this).textTheme.subtitle2!;

  TextStyle get headline1 => Theme.of(this).textTheme.headline1!;

  TextStyle get headline2 => Theme.of(this).textTheme.headline2!;

  TextStyle get headline3 => Theme.of(this).textTheme.headline3!;

  TextStyle get headline4 => Theme.of(this).textTheme.headline4!;

  TextStyle get headline5 => Theme.of(this).textTheme.headline5!;

  TextStyle get headline6 => Theme.of(this).textTheme.headline6!;

  TextStyle get displaySmall => Theme.of(this).textTheme.displaySmall!;

  TextStyle get displayMedium => Theme.of(this).textTheme.displayMedium!;

  TextStyle get displayLarge => Theme.of(this).textTheme.displayLarge!;

  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;

  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;

  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;

  TextStyle get labelSmall => Theme.of(this).textTheme.labelSmall!;

  TextStyle get labelMedium => Theme.of(this).textTheme.labelMedium!;

  TextStyle get labelLarge => Theme.of(this).textTheme.labelLarge!;
}
