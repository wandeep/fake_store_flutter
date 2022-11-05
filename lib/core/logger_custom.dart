import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrefixPrinter(
    PrettyPrinter(colors: false, lineLength: 80),
  ),
);
