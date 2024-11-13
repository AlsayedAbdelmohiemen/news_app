import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: const Color(0xFF39A552),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 1,
      color: Color(0xFF39A552),
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
    ),
  );
}
