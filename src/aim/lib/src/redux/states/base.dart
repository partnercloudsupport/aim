// loading status
enum Status {
  toload,
  loading,
  loaded,
  failed,
}

// base state
class State {
  Status status;
  String msg;

  State({this.status, this.msg});

  factory State.init() => State(status: Status.toload);
  factory State.loading() => State(status: Status.loading);
  factory State.loaded() => State(status: Status.loaded);
  factory State.failed(String msg) => State(status: Status.failed, msg: msg);

  bool get isLoading => status==Status.loading;
  bool get isLoaded => status==Status.loaded;
  bool get isFailed => status==Status.failed;
}


