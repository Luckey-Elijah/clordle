import 'package:args/command_runner.dart';
import 'package:clordle/clordle.dart';
import 'package:mason_logger/mason_logger.dart';

class ClordleCommandRunner extends CommandRunner<ExitCode> {
  ClordleCommandRunner({
    Logger? logger,
  })  : _logger = logger ?? Logger(),
        super(
          'clordle',
          'A Wordle clone in the command line.',
        ) {
    addCommand(PlayCommand(_logger));
  }

  final Logger _logger;
}
