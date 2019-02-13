import 'base.dart';
export 'base.dart';

class Pages {
  // news home page
  PageNewsHome

  // stock detail page
  PageStockDetail stockDetail;

}


class PageNewsHome extends StateBase {}


class PageStockDetail extends StateBase {
  String id;

  PageStockDetail({this.id, ActionStatus status, String tip}): super(status: status, tip: tip);

  factory PageStockDetail.init() {
    return PageStockDetail(
        status: ActionStatus.todo
    );
  }

  PageStockDetail copyWith({String id, ActionStatus status, String tip}) {
    return PageStockDetail(
        id: id??this.id,
        status: status??this.status,
        tip: tip??this.tip
    );
  }
}
