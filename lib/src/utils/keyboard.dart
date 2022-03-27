import 'package:clordle/clordle.dart';

/// Generates the keyboard.
/// Generally use this with `.join('\n')` to create a human-readable board:
///
/// ```dart
/// final actual = keyboard().join('\n');
/// const matcher = '''
///   ┌─────────────────────┐
///   │ Q W E R T Y U I O P │
///   │  A S D F G H J K L  │
///   │    Z X C V B N M    │
///   └─────────────────────┘''';
/// assert(actual == matcher);
/// ```
Iterable<String> keyboard({
  Iterable<Letter> playedLetters = const [],
}) sync* {
  final hits = playedLetters.where((letter) => letter.state == LetterState.hit);
  final misses =
      playedLetters.where((letter) => letter.state == LetterState.miss);
  final closes =
      playedLetters.where((letter) => letter.state == LetterState.close);

  const qwer = ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'];
  const asdf = ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'];
  const zxcv = ['Z', 'X', 'C', 'V', 'B', 'N', 'M'];

  final _qwer =
      keyboardRow(qwer, hits: hits, misses: misses, closes: closes).join(' ');
  final _asdf =
      keyboardRow(asdf, hits: hits, misses: misses, closes: closes).join(' ');
  final _zxcv =
      keyboardRow(zxcv, hits: hits, misses: misses, closes: closes).join(' ');

  yield '┌─────────────────────┐';
  yield '│ $_qwer │';
  yield '│  $_asdf  │';
  yield '│    $_zxcv    │';
  yield '└─────────────────────┘';
}

Iterable<String> keyboardRow(
  Iterable<String> letters, {
  Iterable<Letter> hits = const <Letter>[],
  Iterable<Letter> misses = const <Letter>[],
  Iterable<Letter> closes = const <Letter>[],
}) sync* {
  for (final letter in letters) {
    if (hits.any((hit) => hit.character == letter)) {
      yield hit(letter);
    } else if (misses.any((miss) => miss.character == letter)) {
      yield miss(letter);
    } else if (closes.any((close) => close.character == letter)) {
      yield close(letter);
    } else {
      yield letter;
    }
  }
}
