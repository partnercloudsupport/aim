// loading status
enum Status {
  loading,
  loaded,
  failed,
}


// base state
class BaseState {
  Status status;
  String msg;

  BaseState({this.status, this.msg});

  bool get isLoading => status==Status.loading;
  bool get isLoaded => status==Status.loaded;
  bool get isFailed => status==Status.failed;
}
