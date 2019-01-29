import 'base.dart';
export 'base.dart';


class UserState extends StateBase {
  // session id
  String sid;
  // user id
  int uid;

  UserState({ActionStatus status, this.sid, this.uid, String error}): super(status: status, error: error);

  factory UserState.init() {
    return UserState(
      status: ActionStatus.todo
    );
  }
}
