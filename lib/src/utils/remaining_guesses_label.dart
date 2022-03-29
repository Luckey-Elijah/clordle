/// Creates the grammatically correct human-readable string for the number of
/// remaining guesses.
String remainingGuessesLabel(int value) =>
    '$value remaining guess${value == 1 ? '' : 'es'}.';
