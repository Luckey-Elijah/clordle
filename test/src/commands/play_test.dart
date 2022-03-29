import 'package:clordle/clordle.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockLogger extends Mock implements Logger {}

void main() {
  group('PlayCommand', () {
    late PlayCommand command;
    late Logger logger;

    setUp(() {
      logger = MockLogger();
      when(() => logger.write(any())).thenAnswer((_) {});
      when(() => logger.info(any())).thenAnswer((_) {});
      when(() => logger.success(any())).thenAnswer((_) {});
      when(() => logger.err(any())).thenAnswer((_) {});
      command = PlayCommand(logger);
    });

    test('should have correct name', () {
      expect(command.name, 'play');
    });

    test('should have correct description', () {
      expect(command.description, 'Start the Clordle game.');
    });

    test('Run winning scenario', () {
      const word = 'CRANE';

      final command = PlayCommand(logger, [word]);
      when(() => logger.prompt('GUESS:')).thenReturn(word);

      expect(command.run(), ExitCode.success);

      verify(() => logger.success('You won!')).called(1);
      verifyNever(() => logger.err(any()));
    });

    test('Run lossing scenario', () {
      const word = 'CRANE';

      final command = PlayCommand(logger, [word]);
      when(() => logger.prompt('GUESS:')).thenReturn('incorrect');

      expect(command.run(), ExitCode.success);

      verifyNever(() => logger.success(any()));
      verify(() => logger.err('You lost! The word was $word')).called(1);
    });
  });
}
