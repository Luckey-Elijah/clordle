import 'package:clordle/clordle.dart';
import 'package:equatable/equatable.dart';

/// {@template letter}
/// The game's representation of a letter.
/// {@endtemplate}
class Letter extends Equatable {
  /// {@macro letter}
  const Letter(this.status, this.character);

  /// The current state of this letter.
  final LetterStatus status;

  /// This letter's character string.
  final String character;

  @override
  List<Object> get props => [status, character];
}
