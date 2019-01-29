import 'base.dart';
export 'base.dart';


class LaunchState extends StateBase {
  // local asset key
  String assetKey;
  // remote image url
  String imageUrl;

  LaunchState({ActionStatus status, this.assetKey, this.imageUrl, String error}): super(status: status, error: error);

  factory LaunchState.init() {
    return LaunchState(
      status: ActionStatus.todo
    );
  }

  LaunchState copyWith({ActionStatus status, String assetKey, String imageUrl, String error}) {
    return LaunchState(
      status: status??this.status,
      assetKey: assetKey??this.assetKey,
      imageUrl: imageUrl??this.imageUrl,
      error: error??this.error
    );
  }
}
