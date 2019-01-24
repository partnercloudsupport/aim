import 'package:flutter/material.dart';


class ColorFormat {
  // price color
  static Color price(value) {
    if (value == null) {
      return Colors.grey;
    }

    if(value > 0){
      return Colors.red;
    } else if (value < 0) {
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }
}

class StringFormat {
  static String money(double value) {
    if(value == null){
      return '--';
    }

    return value.toStringAsFixed(2);
  }

  static String quote(double value) {
    if(value == null){
      return '--';
    }

    return value.toStringAsFixed(2);
  }

  static String price(double value) {
    if(value == null){
      return '--';
    }

    if (value > 0){
      return '+${quote(value)}';
    } else if (value<0) {
      return '-${quote(value)}';
    } else {
      return '${quote(value)}';
    }
  }

  static String percent(double value) {
    if(value == null){
      return '--';
    }

    return '${(100*value).toStringAsFixed(2)}%';
  }

  static String percent1(double value) {
    if(value == null){
      return '--';
    }

    if (value > 0){
      return '+${percent(value)}';
    } else if (value<0) {
      return '-${percent(value)}';
    } else {
      return '${percent(value)}';
    }
  }
}