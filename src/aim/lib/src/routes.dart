import 'package:flutter/material.dart';

import 'screen/launch.dart';
import 'screen/home.dart';
import 'screen/search.dart';


class Routes {
  static final launch = "/";
  static final home = "/home";

  static final searchStock = "/stock/search";
  static final stockDetail = "/stock/detail";
  static final editOptionalStock = "/stock/optional/edit";

  static Map<String, WidgetBuilder> routes = {
    launch: (context) {
      return LaunchPage();
    },
    home: (context) {
      return HomePage();
    },
    searchStock: (context) {
      return SearchStockPage();
    }
  };
}
