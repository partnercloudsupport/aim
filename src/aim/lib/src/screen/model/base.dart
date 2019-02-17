import '../../state/base.dart';

// view status
enum ViewStatus {toload, loading, loaded, failed}

// view state base class
abstract class ViewState {
  // view status
  ViewStatus status;
  String tip;

  ViewState({this.status=ViewStatus.toload, this.tip});

  bool get isToLoad => this.status == ViewStatus.toload;
  bool get isLoading => this.status == ViewStatus.loading;
  bool get isLoaded => this.status == ViewStatus.loaded;
  bool get isFailed => this.status == ViewStatus.failed;

  bool get canLoad => this.status != ViewStatus.loading && this.status != ViewStatus.loaded;
}

ViewStatus joinStatus(List<DataStatus> dss) {
  ViewStatus viewStatus = ViewStatus.loaded;
  for (var status in dss) {
    if(status == null || status == DataStatus.toload){
      viewStatus = ViewStatus.toload;
      break;
    } else if(status == DataStatus.loading) {
      viewStatus = ViewStatus.loading;
      break;
    } else if(status == DataStatus.failed) {
      viewStatus = ViewStatus.failed;
      break;
    } else {
      ;
    }
  }
  return viewStatus;
}

String joinTips(List<String> tips) {
  return tips.join(' | ');
}
