// loading status
enum LStatus {
  toload,
  loading,
  loaded,
  failed,
}

// loading state
class LState {
  LStatus status;
  String msg;

  LState({this.status, this.msg});

  factory LState.init() => LState(status: LStatus.toload);
  factory LState.loading() => LState(status: LStatus.loading);
  factory LState.loaded() => LState(status: LStatus.loaded);
  factory LState.failed(String msg) => LState(status: LStatus.failed, msg: msg);

  bool get isLoading => status==LStatus.loading;
  bool get isLoaded => status==LStatus.loaded;
  bool get isFailed => status==LStatus.failed;
}


// pull/push refresh status
enum PPStatus {
  refreshing,
  loading,

}

// pull/push refresh state
class PPState {

}
