import '../status.dart';

// view state base class
abstract class ViewState {
  // view status
  Status status;
  String tip;

  ViewState({this.status=Status.toload, this.tip});

  bool get isToLoad => this.status == Status.toload;
  bool get isLoading => this.status == Status.loading;
  bool get isLoaded => this.status == Status.loaded;
  bool get isFailed => this.status == Status.failed;
}

