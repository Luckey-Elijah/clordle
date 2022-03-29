import 'dart:math';

import 'package:args/command_runner.dart';
import 'package:clordle/clordle.dart';
import 'package:mason_logger/mason_logger.dart';

/// {@template play_command}
/// Entry point to the `play` sub-command.
/// {@endtemplate}
class PlayCommand extends Command<ExitCode> {
  /// {@macro play_command}
  PlayCommand(this._logger, [List<String> seed = words]) : _words = seed;

  final Logger _logger;
  final List<String> _words;

  @override
  ExitCode run() {
    final word = getWord(_words, Random().nextInt);
    final game = GameState(wordle: word);

    while (gameShouldContinue(game, _logger.prompt)) {
      _logger
        ..write(gameboard(game.guesses).join('\n'))
        ..write('\n')
        ..info(remainingGuessesLabel(game.remainingTurns))
        ..write(keyboard(playedLetters: game.letterGuesses).join('\n'))
        ..write('\n');
    }

    if (game.status == GameStatus.win) {
      _logger.success('You won!');
    } else {
      _logger.err('You lost! The word was ${game.wordle}');
    }

    return ExitCode.success;
  }

  @override
  String get description => 'Start the Clordle game.';

  @override
  String get name => 'play';
}
