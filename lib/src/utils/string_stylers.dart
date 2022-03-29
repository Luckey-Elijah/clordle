import 'package:mason_logger/mason_logger.dart';

/// {@template style}
/// Style the given [value].
/// {@endtemplate}
String hit(String value) => green.wrap(_boldUnderline(value))!;

/// {@macro style}
String miss(String value) => red.wrap(_boldUnderline(value))!;

/// {@macro style}
String close(String value) => yellow.wrap(_boldUnderline(value))!;

String _boldUnderline(String value) =>
    styleBold.wrap(styleUnderlined.wrap(value))!;
