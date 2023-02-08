// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  EdgeInsets get padding => MediaQuery.of(this).padding;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get textScale => MediaQuery.of(this).textScaleFactor;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get textColor => Theme.of(this).textTheme.bodyText1!.color!;

  Color get textColor2 =>
      Theme.of(this).textTheme.bodyText1!.color!.withOpacity(.3);

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get accentColor => Theme.of(this).colorScheme.secondary;

  Color get displayColor => Theme.of(this).textTheme.headline3!.color!;

  Color get hintColor => Theme.of(this).hintColor;

  Color get disableColor => Theme.of(this).disabledColor;

  Color get backgroundColor => Theme.of(this).backgroundColor;

  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

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
