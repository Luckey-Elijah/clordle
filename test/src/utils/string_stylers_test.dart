import 'package:clordle/clordle.dart';
import 'package:test/test.dart';

void main() {
  group('string stylers', () {
    test('hit', () {
      expect(hit('value'), 'value');
    });

    test('miss', () {
      expect(miss('value'), 'value');
    });

    test('close', () {
      expect(close('value'), 'value');
    });
  });
}
