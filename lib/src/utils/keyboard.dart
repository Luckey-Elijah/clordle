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
  final hits =
      playedLetters.where((letter) => letter.status == LetterStatus.hit);
  final misses =
      playedLetters.where((letter) => letter.status == LetterStatus.miss);
  final closes =
      playedLetters.where((letter) => letter.status == LetterStatus.close);

  const qwerRow = ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'];
  const asdfRow = ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'];
  const zxcvRow = ['Z', 'X', 'C', 'V', 'B', 'N', 'M'];

  final qwer = keyboardRow(
    qwerRow,
    close,
    hit,
    miss,
    hits: hits,
    misses: misses,
    closes: closes,
  ).join(' ');
  final asdf = keyboardRow(
    asdfRow,
    close,
    hit,
    miss,
    hits: hits,
    misses: misses,
    closes: closes,
  ).join(' ');
  final zxcv = keyboardRow(
    zxcvRow,
    close,
    hit,
    miss,
    hits: hits,
    misses: misses,
    closes: closes,
  ).join(' ');

  yield '┌─────────────────────┐';
  yield '│ $qwer │';
  yield '│  $asdf  │';
  yield '│    $zxcv    │';
  yield '└─────────────────────┘';
}

/// Generates a single row for [keyboard].
Iterable<String> keyboardRow(
  Iterable<String> letters,
  String Function(String) close,
  String Function(String) hit,
  String Function(String) miss, {
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
