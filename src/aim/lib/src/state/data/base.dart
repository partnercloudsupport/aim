import '../status.dart';

// data state base class
abstract class DataState {
  // data status
  Status status;
  String tip;

  // time record for data expiration
  Duration life;
  DateTime _born;

  DataState({this.status=Status.toload, this.tip, this.life}){
    if(this.status == Status.loaded) {
      this._born = DateTime.now();
    }
  }

  bool get isToLoad => this.status == Status.toload;
  bool get isLoading => this.status == Status.loading;
  bool get isLoaded => this.status == Status.loaded;
  bool get isFailed => this.status == Status.failed;

  bool get isExpired => this.status != Status.loaded || this.life == null || DateTime.now().difference(this._born) > this.life ;
  bool get isUsable => this.status == Status.loaded && (this.life == null || (DateTime.now().difference(this._born) > this.life));
}