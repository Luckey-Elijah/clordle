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

    test('remaining turns', () {
      final game = GameState(wordle: 'wordle', maxGuesses: 3);
      expect(game.remainingTurns, 3);

      game.guess('lworda');
      expect(game.remainingTurns, 2);
    });

    test('letter guesses', () {
      final game = GameState(wordle: 'wordle', maxGuesses: 2)..guess('lworda');

      expect(
        game.letterGuesses,
        equals(<Letter>{
          const Letter(LetterStatus.close, 'W'),
          const Letter(LetterStatus.close, 'O'),
          const Letter(LetterStatus.close, 'R'),
          const Letter(LetterStatus.close, 'D'),
          const Letter(LetterStatus.close, 'L'),
          const Letter(LetterStatus.miss, 'A')
        }),
      );
    });
  });

  test('Word', () {
    final actual = Word.fromGuess('wordle', 'wordle');
    const matcher = Word(
      [
        Letter(LetterStatus.hit, 'w'),
        Letter(LetterStatus.hit, 'o'),
        Letter(LetterStatus.hit, 'r'),
        Letter(LetterStatus.hit, 'd'),
        Letter(LetterStatus.hit, 'l'),
        Letter(LetterStatus.hit, 'e')
      ],
    );

    expect(actual, matcher);
  });
}
