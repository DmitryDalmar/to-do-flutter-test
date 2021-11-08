import 'package:flutter/material.dart';
import 'interfaces/custom_theme.dart';

class LightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        textTheme: _textTheme,
        primarySwatch: Colors.amber,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 16,
            shadowColor: Colors.black45,
            minimumSize: const Size(double.infinity, 55.0),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 2),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 2),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 22,
            horizontal: 26,
          ),
          hintStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color:Colors.black26),
        ),
      );

  static const TextTheme _textTheme = TextTheme(
    headline6: TextStyle(fontSize: 22.0),
    subtitle1: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
    bodyText1: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    overline: TextStyle(fontSize: 14),
    button: TextStyle(fontSize: 18),
  );
}
