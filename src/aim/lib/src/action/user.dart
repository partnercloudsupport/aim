class ActionUserLogin{
  final String user;
  final String pwd;
  ActionUserLogin({this.user, this.pwd});
}

class ActionUserLoginSucceed{
  final String sid;
  final String uid;
  ActionUserLoginSucceed({this.sid, this.uid});
}

class ActionUserLoginFailed {
  final String error;
  ActionUserLoginFailed({this.error});
}

class ActionSessionLogin{
  final String sid;
  final String uid;
  ActionSessionLogin({this.sid, this.uid});
}

class ActionSessionLoginSucceed{
  final String sid;
  final String uid;
  ActionSessionLoginSucceed({this.sid, this.uid});
}

class ActionSessionLoginFailed {
  final String error;
  ActionSessionLoginFailed({this.error});
}
