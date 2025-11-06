import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppTheme.background,

    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Clash Display',
        fontWeight: FontWeight.w500,
        fontSize: 60.sp,
        color: Colors.black,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Clash Display',
        fontWeight: FontWeight.w400,
        fontSize: 48.sp,
        color: Colors.black,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 32.sp,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 24.sp,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontSize: 24.sp,
        color: textSecondary
      ),
      bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 32.sp,
          color: Colors.black
      ),
      bodyMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          fontSize: 24.sp,
          color: textButton
      ),
      bodySmall:  TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color: Colors.white
      ),
      labelMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
          color: Colors.white
      ),
      labelSmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          color: Colors.white
      ),
    ),

  );


  ///COLOURS
  static const background = Color.fromRGBO(248, 248, 248, 1);
  static const primary = Color(0xFF0A84FF);
  static const secondary = Color.fromRGBO(255, 168, 33, 1);
  static const accent = Color.fromRGBO(236, 158, 12, 0.1);
  static const textPrimary = Color.fromRGBO(0, 0, 0, 1);
  static const textSecondary = Color.fromRGBO(87, 87, 87, 1);
  static const selectedColor = Color.fromRGBO(251, 176, 59, 1);
  static const textButton = Color.fromRGBO(128, 128, 128, 1);
  static const buttonColor = Color.fromRGBO(124, 124, 124, 0.1);
  static const borderColorPrimary = Color.fromRGBO(0, 0, 0, 0.1);
  static const borderColorSecondary = Color.fromRGBO(229, 229, 229, 1);
  static const successText = Color.fromRGBO(27, 164, 0, 1);
  static const successBg = Color.fromRGBO(200, 255, 189, 1);



  static const LinearGradient headingGradient = LinearGradient(
    colors: [Color.fromRGBO(251, 176, 59, 1), Color.fromRGBO(236, 12, 67, 1)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );


  static const LinearGradient glassGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFFFFFFF),
      Color.fromARGB(0, 207, 207, 207),
      Color.fromARGB(0, 238, 238, 238),
      Color(0xFFFFFFFF),
    ],
    stops: [0.0, 0.13, 0.87, 1.0],
  );




  ///FONT STYLES

  static const subText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xFF555555),
  );
}
