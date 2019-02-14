import 'base.dart';
export 'base.dart';

class Page {
  // news page
  PageNews news;
  // stock page
  PageStock stock;
}

// news pages
class PageNews {
  PageNewsHome home;
}

class PageNewsHome extends ViewState {

}


// stock pages
class PageStock {
  PageStockDetail detail;
}

class PageStockDetail extends ViewState {

}
