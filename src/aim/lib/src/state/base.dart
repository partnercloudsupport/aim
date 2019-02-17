// data status
enum DataStatus {toload, loading, loaded, failed}

// data state base class
abstract class DataState {
  // data status
  DataStatus status;
  String tip;

  // time record for data expiration
  Duration life;
  DateTime _born;

  DataState({this.status=DataStatus.toload, this.tip, this.life}){
    if(this.status == DataStatus.loaded) {
      this._born = DateTime.now();
    }
  }

  bool get isToLoad => this.status == DataStatus.toload;
  bool get isLoading => this.status == DataStatus.loading;
  bool get isLoaded => this.status == DataStatus.loaded;
  bool get isFailed => this.status == DataStatus.failed;

  bool get isExpired => this.status != DataStatus.loaded || this.life == null || DateTime.now().difference(this._born) > this.life ;
  bool get isUsable => this.status == DataStatus.loaded && (this.life == null || (DateTime.now().difference(this._born) > this.life));
}
