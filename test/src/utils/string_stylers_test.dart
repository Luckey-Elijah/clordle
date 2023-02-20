import 'package:clordle/clordle.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:test/test.dart';

void main() {
  group('string stylers', () {
    test('hit', () {
      expect(hit('value'), styleBold.wrap(green.wrap('value')));
    });

    test('miss', () {
      expect(miss('value'), styleBold.wrap(red.wrap('value')));
    });

    test('close', () {
      expect(close('value'), styleBold.wrap(yellow.wrap('value')));
    });
  });
}
