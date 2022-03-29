import 'package:clordle/clordle.dart';

/// Generates the game board with a given list of [words].
/// Generally use this with `.join('\n')` to create a human-readable board:
///
/// ```dart
/// final board = gameboard(['WORDS']).join('\n');
/// final matcher = '''
///   ┌───┬───┬───┬───┬───┐
///   │ W │ O │ R │ D │ S │
///   └───┴───┴───┴───┴───┘''';
/// assert(board == matcher);
/// ```
///
/// The word count can be any length, but the length all words must be 5.
/// If an empty list is given it will create an empty board like this:
///
/// ```
/// ┌───┬───┬───┬───┬───┐
/// └───┴───┴───┴───┴───┘
/// ```
Iterable<String> gameboard(Iterable<Word> words) sync* {
  yield '┌───┬───┬───┬───┬───┐';

  for (final word in words) {
    if (word.letters.length != 5) {
      throw Exception('The word must be 5 chars long.');
    }

    yield gameboardRow(word, close, hit).join();
  }

  yield '└───┴───┴───┴───┴───┘';
}

/// Generates a row of the gameboard with the given [word].
/// Generally use this with `.join()` to create a single string row:
/// ```dart
/// final row = gameboardRow('WORDS').join();
/// assert(row == '│ W │ O │ R │ D │ S │');
/// ```
/// The word can be any length. A empty string will create a single `'│'`.
Iterable<String> gameboardRow(
  Word word,
  String Function(String) close,
  String Function(String) hit,
) sync* {
  yield '│';

  for (final letter in word.letters) {
    if (letter.status == LetterStatus.hit) {
      yield ' ${hit(letter.character)} │';
    } else if (letter.status == LetterStatus.close) {
      yield ' ${close(letter.character)} │';
    } else {
      yield ' ${letter.character} │';
    }
  }
}
