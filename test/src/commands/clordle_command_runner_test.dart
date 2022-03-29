import 'package:clordle/clordle.dart';
import 'package:test/test.dart';

void main() {
  group('ClordleCommandRunner', () {
    test('should have correct name', () {
      final command = ClordleCommandRunner();
      expect(command.executableName, 'clordle');
    });

    test('should have correct invocation', () {
      final command = ClordleCommandRunner();
      expect(command.invocation, 'clordle <command> [arguments]');
    });

    test('should have correct usage', () {
      final command = ClordleCommandRunner();
      expect(
        command.usage,
        '''
A Wordle clone built for the command line with Dart.

Usage: clordle <command> [arguments]

Global options:
-h, --help    Print this usage information.

Available commands:
  play   Start the Clordle game.

Run "clordle help <command>" for more information about a command.''',
      );
    });
  });
}
