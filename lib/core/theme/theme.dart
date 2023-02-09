import 'package:flutter/material.dart';
import 'package:flutter_samples/core/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_common/ui_common.dart';

abstract class SHTheme {
  static ThemeData dark = ThemeData(
    textTheme: TextTheme(
      bodyText1: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: SHColors.textColor,
      ),
      bodyText2: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: SHColors.textColor,
      ),
      caption: GoogleFonts.montserrat(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: SHColors.textColor,
      ),
      headline2: GoogleFonts.buda(
        fontSize: 60.sp,
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
      selectedItemColor: SHColors.hintcolor,
      unselectedItemColor: SHColors.hintcolor,
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
