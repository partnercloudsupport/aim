import 'package:flutter/material.dart';


class AimTheme {
  static final theme1 = ThemeData.dark().copyWith(
    buttonColor: Colors.grey,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
      buttonColor: Colors.red[600]
    )
  );
}
