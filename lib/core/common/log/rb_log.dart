import 'package:logger/logger.dart';

var RbLog = Logger(
  filter: null, // Use the default LogFilter (-> only log in debug mode)
  printer: _prettyPrinter, // Use the PrettyPrinter to format and print log
  output: null,
  level: null, // Use the default LogOutput (-> send everything to console)
);

var _prettyPrinter = PrettyPrinter(
    methodCount: 2, // number of method calls to be displayed
    errorMethodCount: 8, // number of method calls if stacktrace is provided
    lineLength: 120, // width of the output
    colors: true, // Colorful log messages
    printEmojis: true, // Print an emoji for each log message
    printTime: false // Should each log print contain a timestamp
    );
