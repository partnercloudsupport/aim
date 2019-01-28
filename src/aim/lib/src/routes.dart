import 'package:flutter/widgets.dart';

import 'screen/home.dart';
import 'screen/search.dart';

class AimRoutes {
  static final home = "/";
  static final searchStock = "/stock/search";
  static final stockDetail = "/stock/detail";
  static final editOptionalStock = "/stock/optional/edit";

  static Map<String, WidgetBuilder> routes = {
    home: (context) {
      return HomePage();
    },
    searchStock: (context) {
      return StockSearchPage();
    }
  };
}
