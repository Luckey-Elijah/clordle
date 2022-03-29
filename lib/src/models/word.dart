import 'package:clordle/clordle.dart';
import 'package:equatable/equatable.dart';

/// {@template word}
/// The game's representation of a word.
/// {@endtemplate}
class Word extends Equatable {
  /// {@macro word}
  const Word(this.letters);

  /// Generate a word from a guess.
  factory Word.fromGuess(String guess, String wordle) =>
      Word(_letterMapper(guess, wordle).toList());

  /// The letters that represent this word.
  final List<Letter> letters;

  /// Whether each letter in this words is a matching letter.
  bool get isMatch => letters.every((l) => l.status == LetterStatus.hit);

  static Iterable<Letter> _letterMapper(String guess, String wordle) sync* {
    final guessLetters = guess.split('');
    final wordleLetters = wordle.split('');

    for (var i = 0; i < guessLetters.length; i++) {
      final gLetter = guessLetters[i];
      if (gLetter == wordleLetters[i]) {
        yield Letter(LetterStatus.hit, gLetter);
      } else if (wordle.contains(gLetter)) {
        yield Letter(LetterStatus.close, gLetter);
      } else {
        yield Letter(LetterStatus.miss, gLetter);
      }
    }
  }

  @override
  List<Object> get props => [letters];
}
