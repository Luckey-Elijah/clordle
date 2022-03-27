import 'package:equatable/equatable.dart';

enum LetterState { hit, miss, close, unmatched }

enum GameStatus { win, loss, cont }

class Letter extends Equatable {
  const Letter(this.state, this.character);

  final LetterState state;
  final String character;

  @override
  List<Object> get props => [state, character];
}

class Word extends Equatable {
  const Word(this.letters);

  factory Word.fromGuess(String guess, String wordle) =>
      Word(letterMapper(guess, wordle).toList());

  final List<Letter> letters;

  bool get isMatch => letters.every((l) => l.state == LetterState.hit);

  @override
  List<Object> get props => letters;

  static Iterable<Letter> letterMapper(String guess, String wordle) sync* {
    final guessLetters = guess.split('');
    final wordleLetters = wordle.split('');

    for (var i = 0; i < guessLetters.length; i++) {
      final gLetter = guessLetters[i];
      if (gLetter == wordleLetters[i]) {
        yield Letter(LetterState.hit, gLetter);
      } else if (wordle.contains(gLetter)) {
        yield Letter(LetterState.close, gLetter);
      } else {
        yield Letter(LetterState.miss, gLetter);
      }
    }
  }
}

class GameState {
  GameState({
    required this.wordle,
    this.maxGuesses = 6,
  });

  List<Word> get guesses => _guesses;
  int get remainingTurns => maxGuesses - guesses.length;

  Set<Letter> get letterGuesses =>
      _guesses.expand<Letter>((w) => w.letters).toSet();

  final List<Word> _guesses = [];
  final String wordle;
  final int maxGuesses;
  late GameStatus status;

  /// When a guess is made, the word is evaluated and returns the appropiate
  /// [GameStatus].
  GameStatus guess(String guess) {
    final word = Word.fromGuess(guess, wordle);

    _guesses.add(word);

    if (word.isMatch) {
      return status = GameStatus.win;
    } else if (guesses.length == maxGuesses) {
      return status = GameStatus.loss;
    }
    return status = GameStatus.cont;
  }
}
