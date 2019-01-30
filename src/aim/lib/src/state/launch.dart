import 'base.dart';
export 'base.dart';


class LaunchState extends StateBase {
  // delay duration in seconds
  int duration;
  // local asset key
  String assetKey;
  // remote image url
  String imageUrl;

  // launch finished
  bool finished;

  LaunchState({ActionStatus status, this.duration, this.assetKey, this.imageUrl, this.finished, String error}): super(status: status, error: error);

  factory LaunchState.init() {
    return LaunchState(
      status: ActionStatus.todo,
      finished: false
    );
  }

  LaunchState copyWith({ActionStatus status, int duration, String assetKey, String imageUrl, bool finished, String error}) {
    return LaunchState(
      duration: duration??this.duration,
      status: status??this.status,
      assetKey: assetKey??this.assetKey,
      imageUrl: imageUrl??this.imageUrl,
      finished: finished??this.finished,
      error: error??this.error
    );
  }
}
