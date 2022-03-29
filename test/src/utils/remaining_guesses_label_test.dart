import 'package:clordle/clordle.dart';
import 'package:test/test.dart';

void main() {
  test('remainingGuessesLabel', () {
    expect(remainingGuessesLabel(1), '1 remaining guess.');
    expect(remainingGuessesLabel(2), '2 remaining guesses.');
  });
}
