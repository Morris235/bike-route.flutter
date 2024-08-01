// 전역 로거 인스턴스
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

final Logger logger = Logger('GraphQLLogger');

// 로깅 설정 함수
void setupLogging() {
  Logger.root.level = Level.ALL; // 전체 로그 레벨 설정
  Logger.root.onRecord.listen((LogRecord rec) {
    if (kDebugMode) {
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
    }
    if (rec.error != null) {
      if (kDebugMode) {
        print('Error: ${rec.error}');
      }
    }
    if (rec.stackTrace != null) {
      if (kDebugMode) {
        print('StackTrace: ${rec.stackTrace}');
      }
    }
  });
}
