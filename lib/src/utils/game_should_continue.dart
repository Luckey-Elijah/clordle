import 'package:clordle/clordle.dart';

/// Evaluates the given [game] and determines if the game has not ended.
bool gameShouldContinue(GameState game, String Function(String) guesser) {
  return game.guess(
        guesser('GUESS:').toUpperCase().padRight(5).substring(0, 5),
      ) ==
      GameStatus.cont;
}
