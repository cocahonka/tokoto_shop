import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Muli',
  appBarTheme: appBarTheme,
  textTheme: textTheme,
  inputDecorationTheme: inputDecorationTheme,
  primarySwatch: Colors.blue,
);

const textTheme = TextTheme(
  bodyText1: TextStyle(color: kTextColor),
  bodyText2: TextStyle(color: kTextColor),
);

const appBarTheme = AppBarTheme(
  color: Colors.white,
  iconTheme: IconThemeData(color: Colors.black),
  elevation: 0,
  systemOverlayStyle:
      SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
  titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18),
  centerTitle: true,
);

final _outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(28),
  borderSide: const BorderSide(color: kTextColor),
  gapPadding: 10,
);

final inputDecorationTheme = InputDecorationTheme(
  floatingLabelBehavior: FloatingLabelBehavior.always,
  contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
  enabledBorder: _outlineInputBorder,
  focusedBorder: _outlineInputBorder,
  border: _outlineInputBorder,
  errorStyle: const TextStyle(height: 0),
);
