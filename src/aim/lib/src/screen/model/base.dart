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

ViewStatus convertStatus(DataStatus ds) {
  if(ds == DataStatus.toload){
    return ViewStatus.toload;
  } else if(ds == DataStatus.loading){
    return ViewStatus.loading;
  } else if(ds == DataStatus.loaded) {
    return ViewStatus.loaded;
  } else if(ds == DataStatus.failed) {
    return ViewStatus.failed;
  } else {
    return ViewStatus.toload;
  }
}

ViewStatus joinStatus(List<DataStatus> dss) {
  for (var status in dss) {
    if(status == null || status == DataStatus.toload){
      return ViewStatus.toload;
    } else if(status == DataStatus.loading) {
      return ViewStatus.loading;
    } else if(status == DataStatus.failed) {
      return ViewStatus.failed;
    } else {}
  }
  return ViewStatus.loaded;
}

String joinTips(List<String> tips) {
  return tips.join(' | ');
}
