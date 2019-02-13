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


/// action status
enum ActionStatus {todo, doing, done, failed}

/// state base class
abstract class StateBase {
  ActionStatus status;
  String tip;
  StateBase({this.status=ActionStatus.todo, this.tip});

  bool get isTodo => status == ActionStatus.todo;
  bool get isDoing => status == ActionStatus.doing;
  bool get isDone => status == ActionStatus.done;
  bool get isFailed => status == ActionStatus.failed;
  bool get isReady => status == ActionStatus.done;
}
