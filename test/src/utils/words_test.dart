import 'package:clordle/clordle.dart';
import 'package:test/test.dart';

void main() {
  test('every word is five characters long', () {
    expect(words.every((word) => word.length == 5), isTrue);
  });
}
