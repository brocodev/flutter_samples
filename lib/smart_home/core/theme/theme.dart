import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_common/ui_common.dart';

abstract class SHTheme {
  static ThemeData dark = ThemeData(
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: SHColors.textColor,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: SHColors.textColor,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: SHColors.textColor,
      ),
      displayLarge: GoogleFonts.buda(
        fontSize: 60.sp,
        color: SHColors.textColor,
      ),
      displayMedium: GoogleFonts.buda(
        fontSize: 50.sp,
        color: SHColors.textColor,
      ),
      displaySmall: GoogleFonts.buda(
        fontSize: 40.sp,
        color: SHColors.textColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    iconTheme: const IconThemeData(color: SHColors.textColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedIconTheme: IconThemeData(size: 40.sp),
      unselectedIconTheme: IconThemeData(size: 40.sp),
      selectedItemColor: SHColors.hintColor,
      unselectedItemColor: SHColors.hintColor,
      selectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
      ),
    ),
    scaffoldBackgroundColor: SHColors.scaffoldBackground,
  );
}
