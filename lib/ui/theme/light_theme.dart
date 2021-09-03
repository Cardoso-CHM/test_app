import 'package:flutter/material.dart';

ThemeData lightTheme() {
  TextTheme _lightTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 72,
        color: Colors.black,
        fontWeight: FontWeight.w600
      ),
      headline4: base.headline4?.copyWith(
        color: Colors.white,
        fontFamily: 'Inter',
      ),
      headline6: base.headline6?.copyWith(
        color: Colors.black,
        fontFamily: 'Inter',
        fontWeight: FontWeight.bold
      ),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _lightTextTheme(base.textTheme),
    primaryColor: const Color(0xff1C4D87),
  );
}
