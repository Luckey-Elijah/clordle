import 'package:clordle/clordle.dart';
import 'package:test/test.dart';

void main() {
  test(
    '[gameboard] generates a gameboard',
    () {
      const words = Word(
        [
          Letter(LetterState.unmatched, 'W'),
          Letter(LetterState.unmatched, 'O'),
          Letter(LetterState.unmatched, 'R'),
          Letter(LetterState.unmatched, 'D'),
          Letter(LetterState.unmatched, 'S'),
        ],
      );
      const asdfg = Word(
        [
          Letter(LetterState.unmatched, 'A'),
          Letter(LetterState.unmatched, 'S'),
          Letter(LetterState.unmatched, 'D'),
          Letter(LetterState.unmatched, 'F'),
          Letter(LetterState.unmatched, 'G'),
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
    final fourX =
        Word(List.generate(4, (_) => const Letter(LetterState.unmatched, 'X')));

    final sixX =
        Word(List.generate(4, (_) => const Letter(LetterState.unmatched, 'X')));
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
    final fiveX =
        Word(List.generate(5, (_) => const Letter(LetterState.unmatched, 'X')));

    var actual = gameboardRow(fiveX).join();
    expect(actual, '│ X │ X │ X │ X │ X │');

    actual = gameboardRow(const Word([])).join();
    expect(actual, '│');
  });
}
