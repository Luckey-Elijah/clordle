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
          const Letter(LetterState.close, 'W'),
          const Letter(LetterState.close, 'O'),
          const Letter(LetterState.close, 'R'),
          const Letter(LetterState.close, 'D'),
          const Letter(LetterState.close, 'L'),
          const Letter(LetterState.miss, 'A')
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
