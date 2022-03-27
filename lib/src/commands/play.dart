import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:clordle/clordle.dart';
import 'package:mason_logger/mason_logger.dart';

class PlayCommand extends Command<ExitCode> {
  PlayCommand(this.logger) {
    argParser
      ..addOption(
        'word',
        abbr: 'w',
        defaultsTo: 'CRANE',
        help: 'The target word. Used for debugging.',
      )
      ..addOption(
        'max',
        abbr: 'm',
        defaultsTo: '6',
        help: 'The max number of guesses/tries.',
      );
  }

  final Logger logger;
  static const _defaultGuesses = 6;
  ArgResults get _argResults => argResults!;

  @override
  ExitCode run() {
    final max = int.tryParse(_argResults['max'] as String) ?? _defaultGuesses;
    final word = _argResults['word'] as String;
    final game = GameState(wordle: word, maxGuesses: max);

    while (_gameIsContinued(game)) {
      logger
        ..write(gameboard(game.guesses).join('\n'))
        ..write('\n')
        ..info(
          '${game.remainingTurns} remain guess'
          '${game.remainingTurns == 1 ? '' : 'es'}.',
        )
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

  bool _gameIsContinued(GameState game) {
    return game.guess(
          logger.prompt('GUESS:').toUpperCase().padRight(5).substring(0, 5),
        ) ==
        GameStatus.cont;
  }

  @override
  String get description => 'Start the Clordle game.';

  @override
  String get name => 'play';
}
