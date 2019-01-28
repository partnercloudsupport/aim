import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

class Device{
  /// 获取屏幕宽度
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// 获取屏幕高度
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// 获取系统状态栏高度
  static double getSysStatsHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  /// 复制文本到剪切板
  static void copyToClipboard(final String text) {
    if (text == null)
      return;
    Clipboard.setData(new ClipboardData(text: text));
  }
}

