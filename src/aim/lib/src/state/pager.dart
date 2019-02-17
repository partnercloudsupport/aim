import 'base.dart';

class PagerData extends DataState {
  // total page
  final int total;
  // current page
  final int page;
  // page list items
  final List<dynamic> items;

  PagerData({this.total, this.page, this.items, DataStatus status, String tip}): super(status: status, tip: tip);
}
