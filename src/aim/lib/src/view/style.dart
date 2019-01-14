import 'package:flutter/material.dart';

// 字体大小
class AimFontSize {
  static final large = 18.0;
  static final normal = 16.0;
  static final medium = 14.0;
  static final small = 12.0;
}

// 字体粗细
class AimFontWeight {
  static final bold = FontWeight.bold;
  static final regular = FontWeight.normal;
  static final thin = FontWeight.w200;
}


// 字体颜色


// 文本样式
class AimTextStyle {
  final largeBold = TextStyle(
    fontSize: AimFontSize.large,
    fontWeight: AimFontWeight.bold,
  );

  final largeRegular = TextStyle(
    fontSize: AimFontSize.large,
    fontWeight: AimFontWeight.regular,
  );

  final largeThin = TextStyle(
    fontSize: AimFontSize.large,
    fontWeight: AimFontWeight.thin,
  );

  final normalBold = TextStyle(
    fontSize: AimFontSize.normal,
    fontWeight: AimFontWeight.bold,
  );

  final normalRegular = TextStyle(
    fontSize: AimFontSize.normal,
    fontWeight: AimFontWeight.regular,
  );

  final normalThin = TextStyle(
    fontSize: AimFontSize.normal,
    fontWeight: AimFontWeight.thin,
  );

  final mediumBold = TextStyle(
    fontSize: AimFontSize.medium,
    fontWeight: AimFontWeight.bold,
  );

  final mediumRegular = TextStyle(
    fontSize: AimFontSize.medium,
    fontWeight: AimFontWeight.regular,
  );

  final mediumThin = TextStyle(
    fontSize: AimFontSize.medium,
    fontWeight: AimFontWeight.thin,
  );

  final smallBold = TextStyle(
    fontSize: AimFontSize.small,
    fontWeight: AimFontWeight.bold,
  );

  final smallRegular = TextStyle(
    fontSize: AimFontSize.small,
    fontWeight: AimFontWeight.regular,
  );

  final smallThin = TextStyle(
    fontSize: AimFontSize.small,
    fontWeight: AimFontWeight.thin,
  );

  // 列表列名
  final listTitle = TextStyle(
      color: Colors.grey,
      fontWeight: AimFontWeight.bold,
      fontSize: AimFontSize.normal
  );

  // 股票名称
  final stockName = TextStyle(
      color: Colors.black,
      fontWeight: AimFontWeight.bold,
      fontSize: AimFontSize.normal
  );

  // 股票代码
  final stockCode = TextStyle(
      color: Colors.grey,
      fontWeight: AimFontWeight.thin,
      fontSize: AimFontSize.medium
  );

  // 新闻标题
  final newsTitle = TextStyle(
    color: Colors.black,
    fontSize: AimFontSize.large,
    fontWeight: AimFontWeight.regular
  );

  // 新闻简介
  final newsBrief = TextStyle(
    color: Colors.black,
    fontSize: AimFontSize.large,
    fontWeight: AimFontWeight.regular
  );

  // 新闻来源
  final newsSource = TextStyle(
    color: Colors.grey,
    fontSize: AimFontSize.small,
    fontWeight: AimFontWeight.thin
  );
}
