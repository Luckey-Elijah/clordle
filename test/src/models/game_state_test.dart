import 'package:clordle/clordle.dart';
import 'package:test/test.dart';

void main() {
  group('GameState', () {
    test('can play a winning game', () {
      final game = GameState(wordle: 'wordle');
      expect(game.guess('lworda'), GameStatus.cont);
      expect(game.guess('wordla'), GameStatus.cont);
      expect(game.guess('wordle'), GameStatus.win);
    });

    test('can play a loosing game', () {
      final game = GameState(wordle: 'wordle', maxGuesses: 1);
      expect(game.guess('wordla'), GameStatus.loss);
    });

    test('letter guesses', () {
      final game = GameState(wordle: 'wordle', maxGuesses: 2)..guess('lworda');

      expect(
        game.letterGuesses,
        equals(<Letter>{
          const Letter(LetterState.close, 'w'),
          const Letter(LetterState.close, 'o'),
          const Letter(LetterState.close, 'r'),
          const Letter(LetterState.close, 'd'),
          const Letter(LetterState.close, 'l'),
          const Letter(LetterState.miss, 'a')
        }),
      );
    });
  });

  test('Word', () {
    final actual = Word.fromGuess('wordle', 'wordle');
    const matcher = Word(
      [
        Letter(LetterState.hit, 'w'),
        Letter(LetterState.hit, 'o'),
        Letter(LetterState.hit, 'r'),
        Letter(LetterState.hit, 'd'),
        Letter(LetterState.hit, 'l'),
        Letter(LetterState.hit, 'e')
      ],
    );

    expect(actual, matcher);
  });
}
