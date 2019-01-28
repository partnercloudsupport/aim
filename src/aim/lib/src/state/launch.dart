import 'base.dart';
export 'base.dart';

class StateLaunch {
  LState state;
  StateLaunch({this.state});

  factory StateLaunch.init() {
    return StateLaunch();
  }

  StateLaunch copyWith({LState state}) {
    return StateLaunch(
      state: state??this.state
    );
  }
}
