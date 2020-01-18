class LogLevel {
  static const String Info = 'info';
  static const String Debug = 'debug';
}

class LogUtils {
  static void printStr(level, module, str) {
    print('[$level],[$module], $str');
  }
}