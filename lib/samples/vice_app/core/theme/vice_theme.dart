import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/vice_app/core/core.dart';
import 'package:ui_common/ui_common.dart';

class ViceTheme {
  const ViceTheme._();

  static ThemeData get theme => ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: ViceColors.purple,
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white54,
          contentPadding: 10.edgeInsetsA,
          border: OutlineInputBorder(
            borderRadius: 40.borderRadiusA,
            borderSide: BorderSide.none,
          ),
        ),
      );
}
