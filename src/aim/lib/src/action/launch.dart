/// action for launch app
class ActionLaunch {}

class ActionLaunchSucceed {}

class ActionLaunchFailed {
  final String error;
  ActionLaunchFailed({this.error});
}
