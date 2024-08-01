import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

final Logger logger = Logger('GraphQLLogger');

void setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
    if (rec.error != null) {
      debugPrint('Error: ${rec.error}');
    }
    if (rec.stackTrace != null) {
      debugPrint('StackTrace: ${rec.stackTrace}');
    }
  });
}
