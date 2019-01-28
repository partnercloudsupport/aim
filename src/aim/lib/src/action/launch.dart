/// action for launch app
class ActionLaunch {}

class ActionLaunchSucceed {}

class ActionLaunchFailed {
  final String msg;
  ActionLaunchFailed({this.msg});
}
