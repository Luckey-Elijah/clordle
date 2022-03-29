import 'package:clordle/clordle.dart';
import 'package:test/test.dart';

void main() {
  test('getWord', () {
    expect(getWord(['word'], (_) => 0), 'word');
  });
}
