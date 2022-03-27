import 'package:mason_logger/mason_logger.dart';

String hit(String value) => green.wrap(_boldUnderline(value))!;

String miss(String value) => red.wrap(_boldUnderline(value))!;

String close(String value) => yellow.wrap(_boldUnderline(value))!;

String _boldUnderline(String value) =>
    styleBold.wrap(styleUnderlined.wrap(value))!;
