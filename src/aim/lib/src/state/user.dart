import 'base.dart';
export 'base.dart';

class UserState extends StateBase {
  // session id
  String sid;
  // user id
  String uid;

  UserState({ActionStatus status, this.sid, this.uid, String error}): super(status: status, error: error);

  factory UserState.init() {
    return UserState(
      status: ActionStatus.todo
    );
  }

  UserState copyWith({ActionStatus status, String sid, String uid, String error}){
    return UserState(
      status: status??this.status,
      sid: sid??this.sid,
      uid: uid??this.uid,
      error: error??this.error
    );
  }

  bool get isLogin => uid!=null;
}
