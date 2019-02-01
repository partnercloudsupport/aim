import 'package:flutter/material.dart';

import 'screen/launch.dart';
import 'screen/home.dart';
import 'screen/search.dart';


class AimRoutes {
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
      return StockSearchPage();
    }
  };
}


class AimNav {
  // push a new page
  static Future<T> push<T>(BuildContext context, dynamic page) async {
    if(page is String) {
      return await Navigator.of(context).pushNamed(page);
    } else if(page is Widget){
      return await Navigator.of(context).push(MaterialPageRoute(builder: (context){return page;}));
    } else {
      throw 'unsupported page type';
    }
  }

  // replace

  // pop current page
  static bool pop<T>(BuildContext context, [T result]) {
    return Navigator.of(context).pop(result);
  }

}
