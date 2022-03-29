import 'package:clordle/clordle.dart';
import 'package:test/test.dart';

void main() {
  test('keyboard has expect default output', () {
    final actual = keyboard().join('\n');
    const matcher = '''
┌─────────────────────┐
│ Q W E R T Y U I O P │
│  A S D F G H J K L  │
│    Z X C V B N M    │
└─────────────────────┘''';

    expect(actual, matcher);
  });

  test('keyboard has all the letters', () {
    final kboard = keyboard().join();
    for (final letter in [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'W',
      'X',
      'Y',
      'Z'
    ]) {
      expect(kboard.contains(letter), isTrue);
    }
  });

  test('keyboardRow', () {
    String _nil(String _) => _;
    expect(
      keyboardRow(
        ['Q'],
        _nil,
        _nil,
        _nil,
        closes: [const Letter(LetterStatus.unmatched, 'Q')],
      ).join(),
      'Q',
    );

    expect(
      keyboardRow(
        ['Q'],
        _nil,
        _nil,
        _nil,
        misses: [const Letter(LetterStatus.unmatched, 'Q')],
      ).join(),
      'Q',
    );

    expect(
      keyboardRow(
        ['Q'],
        _nil,
        _nil,
        _nil,
        hits: [const Letter(LetterStatus.unmatched, 'Q')],
      ).join(),
      'Q',
    );
  });
}
