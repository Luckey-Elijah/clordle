import 'package:args/command_runner.dart';
import 'package:clordle/clordle.dart';
import 'package:mason_logger/mason_logger.dart';

class PlayCommand extends Command<ExitCode> {
  PlayCommand(this.logger);

  final Logger logger;

  @override
  ExitCode run() {
    final game = GameState(wordle: 'CRANE');

    while (game.guess(
          logger.prompt('GUESS:').toUpperCase().padRight(5),
        ) ==
        GameStatus.cont) {
      logger
        ..write(gameboard(game.guesses).join('\n'))
        ..write('\n')
        ..info('${game.remainingTurns} remain guesses.')
        ..write(keyboard(playedLetters: game.letterGuesses).join('\n'))
        ..write('\n');
    }

    if (game.status == GameStatus.win) {
      logger.success('You won!');
    } else {
      logger.err('You lost! The word was ${game.wordle}');
    }

    return ExitCode.success;
  }

  @override
  String get description => 'Start the Clordle game.';

  @override
  String get name => 'play';
}
