/// action for launch app
class ActionLaunch {}

class ActionLaunchSucceed {
  // delay duration in seconds
  int duration;
  // remote launch image url
  String imageUrl;
  // local asset image key
  String assetKey;
  ActionLaunchSucceed(this.duration, this.imageUrl, this.assetKey);
}

class ActionLaunchFailed {
  final String error;
  ActionLaunchFailed({this.error});
}

// launch finished
class ActionLaunchFinished{}
