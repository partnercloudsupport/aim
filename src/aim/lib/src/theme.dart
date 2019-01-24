import 'package:flutter/material.dart';
import 'package:aim/src/style.dart';


class AimTheme {
  static get theme {
    return ThemeData.light();
  }

  static final text = AimTextStyle();
  static final colors = AimColors();
}