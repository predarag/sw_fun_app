import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sw_fun_app/core/theme/colors.dart';

ThemeData theme() {
  return ThemeData(
    canvasColor: greyLighter,
    primaryColor: primaryColor,
    primaryColorLight: primaryColorLight,
    dividerColor: dividerColor,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.black,
        fontFamily: 'NouvelRegular',
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      headline2: TextStyle(
        color: Colors.black,
        fontFamily: 'NouvelRegular',
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      headline3: TextStyle(
        color: Colors.black,
        fontFamily: 'NouvelRegular',
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      headline4: TextStyle(
        color: Colors.black,
        fontFamily: 'NouvelRegular',
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
      ),
      headline5: TextStyle(
        color: Colors.black,
        fontFamily: 'NouvelRegular',
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
