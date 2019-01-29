/// log levels
enum Level {DEBUG, INFO, WARN, ERROR, FATAL}

const Map LevelStr = {
  Level.DEBUG: 'debug',
  Level.INFO: 'info',
  Level.WARN: 'warn',
  Level.ERROR: 'error',
  Level.FATAL: 'fatal'
};

/// app logger
class Log {
  static void debug(dynamic msg) {
    _print(Level.DEBUG, msg);
  }

  static void info(dynamic msg) {
    _print(Level.INFO, msg);
  }

  static void warn(dynamic msg) {
    _print(Level.WARN, msg);
  }

  static void error(dynamic msg) {
    _print(Level.ERROR, msg);
  }

  static void fatal(dynamic msg) {
    _print(Level.FATAL, msg);
  }

  static void _print(Level level, dynamic msg) {
    print('[${LevelStr[level]}] - ${msg.toString()} -');
  }
}
