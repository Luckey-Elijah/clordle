import 'package:clordle/clordle.dart';
import 'package:test/test.dart';

void main() {
  test(
    '[gameboard] generates a gameboard',
    () {
      const words = Word(
        [
          Letter(LetterStatus.unmatched, 'W'),
          Letter(LetterStatus.unmatched, 'O'),
          Letter(LetterStatus.unmatched, 'R'),
          Letter(LetterStatus.unmatched, 'D'),
          Letter(LetterStatus.unmatched, 'S'),
        ],
      );
      const asdfg = Word(
        [
          Letter(LetterStatus.unmatched, 'A'),
          Letter(LetterStatus.unmatched, 'S'),
          Letter(LetterStatus.unmatched, 'D'),
          Letter(LetterStatus.unmatched, 'F'),
          Letter(LetterStatus.unmatched, 'G'),
        ],
      );
      var actual = gameboard([words]).join('\n');
      var matcher = '''
┌───┬───┬───┬───┬───┐
│ W │ O │ R │ D │ S │
└───┴───┴───┴───┴───┘''';
      expect(actual, matcher);

      actual = gameboard([words, asdfg]).join('\n');
      matcher = '''
┌───┬───┬───┬───┬───┐
│ W │ O │ R │ D │ S │
│ A │ S │ D │ F │ G │
└───┴───┴───┴───┴───┘''';
    },
  );

  test('[gameboard] throw assertion error when word is not 5 character', () {
    final fourX = Word(
      List.generate(4, (_) => const Letter(LetterStatus.unmatched, 'X')),
    );

    final sixX = Word(
      List.generate(4, (_) => const Letter(LetterStatus.unmatched, 'X')),
    );
    expect(
      () => gameboard([fourX]),
      throwsException,
    );

    expect(
      () => gameboard([sixX]),
      throwsException,
    );
  });

  test('[gameboardRow] generates a row', () {
    String _nil(String _) => _;
    final fiveUnmatchedX = Word(
      List.generate(5, (_) => const Letter(LetterStatus.unmatched, 'X')),
    );

    var actual = gameboardRow(fiveUnmatchedX, _nil, _nil).join();
    expect(actual, '│ X │ X │ X │ X │ X │');

    actual = gameboardRow(const Word([]), _nil, _nil).join();
    expect(actual, '│');

    actual = gameboardRow(
      const Word([Letter(LetterStatus.hit, 'X')]),
      _nil,
      _nil,
    ).join();
    expect(actual, '│ X │');

    actual = gameboardRow(
      const Word([Letter(LetterStatus.close, 'X')]),
      _nil,
      _nil,
    ).join();
    expect(actual, '│ X │');
  });
}
