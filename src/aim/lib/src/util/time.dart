
class TimeFormat {
  static String format(int unixTimestampInSeconds) {
    var dt = DateTime.fromMillisecondsSinceEpoch(unixTimestampInSeconds*1000);
    var duration = DateTime.now().difference(dt);

    if(duration.inDays > 0 || duration.inHours > 12) {
      return '${dt.year.toString().padLeft(4, '0')}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
             //'${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}:${dt.second.toString().padLeft(2, '0')}';
    } else if(duration.inHours > 0) {
      return '${duration.inHours}小时前';
    } else if(duration.inMinutes > 0) {
      return '${duration.inMinutes}分钟前';
    } else {
      return '刚刚';
    }
  }
}

class TimeUtil {
  /// get current timestamp in seconds
  static int getTimestamp() {
    return DateTime.now().millisecondsSinceEpoch ~/ 1000;
  }
}
