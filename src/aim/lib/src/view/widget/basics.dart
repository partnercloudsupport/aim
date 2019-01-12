import 'package:flutter/material.dart';


class TextFontSize {
  static final large = 18.0;
  static final normal = 16.0;
  static final medium = 14.0;
  static final small = 12.0;
}

class TextFontWeight {
  static final bold = FontWeight.bold;
  static final normal = FontWeight.normal;
  static final light = FontWeight.w300;
  static final thin = FontWeight.w100;
}

class TextListTitle extends StatelessWidget {
  final String title;
  final Color color;
  final double size;
  final FontWeight weight;

  TextListTitle({Key key, @required this.title, this.color, this.size, this.weight}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: TextStyle(
        color: color!=null ? color : Colors.grey,
        fontWeight: weight!=null ? weight : TextFontWeight.bold,
        fontSize: size!=null ? size : TextFontSize.normal
      ),
    );
  }
}


class TextStockName extends StatelessWidget {
  final String name;
  final Color color;
  final double size;
  final FontWeight weight;

  TextStockName({Key key, @required this.name, this.color, this.size, this.weight}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.name,
      style: TextStyle(
        color: color!=null ? color : Colors.black,
        fontWeight: weight!=null ? weight : TextFontWeight.bold,
        fontSize: size!=null ? size : TextFontSize.normal
      ),
    );
  }
}


class TextStockCode extends StatelessWidget {
  final String code;
  final Color color;
  final double size;
  final FontWeight weight;

  TextStockCode({Key key, @required this.code, this.color, this.size, this.weight}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.code,
      style: TextStyle(
          color: color!=null ? color : Colors.grey,
          fontWeight: weight!=null ? weight : TextFontWeight.light,
          fontSize: size!=null ? size : TextFontSize.medium
      ),
    );
  }
}


class TextNumber extends StatelessWidget {
  final String number;
  final Color color;
  final double size;
  final FontWeight weight;

  TextNumber({Key key, @required this.number, this.color, this.size, this.weight}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.number,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color!=null ? color : Colors.black,
          fontWeight: weight!=null ? weight : TextFontWeight.normal,
          fontSize: size!=null ? size : TextFontSize.normal
      ),
    );
  }
}


class TextLargeNumber extends StatelessWidget {
  final String number;
  final Color color;
  final double size;
  final FontWeight weight;

  TextLargeNumber({Key key, @required this.number, this.color, this.size, this.weight}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.number,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color!=null ? color : Colors.black,
          fontWeight: weight!=null ? weight : TextFontWeight.normal,
          fontSize: size!=null ? size : TextFontSize.large
      ),
    );
  }
}

class TextSmallNumber extends StatelessWidget {
  final String number;
  final Color color;
  final double size;
  final FontWeight weight;

  TextSmallNumber({Key key, @required this.number, this.color, this.size, this.weight}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.number,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color!=null ? color : Colors.black,
          fontWeight: weight!=null ? weight : TextFontWeight.normal,
          fontSize: size!=null ? size : TextFontSize.small
      ),
    );
  }
}

class RGGColor {
  static Color get(value) {
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

class StringFormatter {
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

  static String quoteChange(double value) {
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

  static String percentChange(double value) {
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