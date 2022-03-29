/// Represents the state/status of a given game.
enum GameStatus {
  /// {@template game_status}
  /// Game is in a
  /// {@endtemplate}
  /// win state.
  win,

  /// {@macro game_status}
  /// loss state.
  loss,

  /// {@macro game_status}
  /// can continue state.
  cont,
}
