import 'package:clordle/clordle.dart';

/// {@template game_state}
/// The state of a given game.
/// {@endtemplate}
class GameState {
  /// {@macro game_state}
  GameState({
    required String wordle,
    this.maxGuesses = 6,
  }) : wordle = wordle.toUpperCase();

  /// All the previously guessed words.
  List<Word> get guesses => _guesses;

  /// The number of turns remaining in this game.
  int get remainingTurns => maxGuesses - guesses.length;

  /// A set of all the letters that have been play. Useful for creating a
  /// keyboard state.
  Set<Letter> get letterGuesses =>
      _guesses.expand<Letter>((w) => w.letters).toSet();

  final List<Word> _guesses = [];

  /// The goal word that is too be guessed.
  final String wordle;

  /// The maximum number of guesses allowed in this game.
  final int maxGuesses;

  /// This game's current status.
  late GameStatus status;

  /// When a guess is made, the word is evaluated and returns the appropriate
  /// [GameStatus]. [status] is also updated when this method is invoked.
  GameStatus guess(String guess) {
    final word = Word.fromGuess(guess.toUpperCase(), wordle);

    _guesses.add(word);

    if (word.isMatch) {
      return status = GameStatus.win;
    } else if (guesses.length == maxGuesses) {
      return status = GameStatus.loss;
    }
    return status = GameStatus.cont;
  }
}
