import 'package:args/command_runner.dart';
import 'package:clordle/clordle.dart';
import 'package:mason_logger/mason_logger.dart';

/// {@template clordle_command_runner}
/// Entry point to the `clordle` cli game.
/// {@endtemplate}
class ClordleCommandRunner extends CommandRunner<ExitCode> {
  /// {@macro clordle_command_runner}
  ClordleCommandRunner({
    Logger? logger,
  })  : _logger = logger ?? Logger(),
        super(
          'clordle',
          'A Wordle clone built for the command line with Dart.',
        ) {
    addCommand(PlayCommand(_logger));
  }

  final Logger _logger;
}
