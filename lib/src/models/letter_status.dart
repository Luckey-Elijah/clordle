/// The state or status of any given letter in the game.
enum LetterStatus {
  /// {@template letter_status}
  /// Represents a letter that
  /// {@endtemplate}
  /// is matching.
  hit,

  /// {@macro letter_status}
  /// does not match.
  miss,

  /// {@macro letter_status}
  /// is in the same word, but the incorrect location.
  close,

  /// {@macro letter_status}
  /// has not yet been check/played.
  unmatched,
}
