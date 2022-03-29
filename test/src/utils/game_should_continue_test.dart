import 'package:clordle/clordle.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockGameState extends Mock implements GameState {}

void main() {
  late GameState game;

  setUp(() {
    game = MockGameState();
    when(() => game.guess(any())).thenReturn(GameStatus.cont);
  });

  group('gameShouldContinue', () {
    test('happy path', () {
      expect(gameShouldContinue(game, (_) => 'CRANE'), isTrue);
    });

    test('transforms to upper case', () {
      gameShouldContinue(game, (_) => 'words');
      verify(() => game.guess('WORDS')).called(1);
    });

    test('pads guess', () {
      gameShouldContinue(game, (_) => 'WORD');
      verify(() => game.guess('WORD ')).called(1);
    });

    test('trims guess length to 5', () {
      gameShouldContinue(game, (_) => 'WORDSQWERQWER');
      verify(() => game.guess('WORDS')).called(1);
    });
  });
}
