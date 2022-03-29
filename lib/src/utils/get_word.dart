/// Select the word from [words] using the selector.
String getWord(List<String> words, int Function(int) selector) =>
    words[selector(words.length)];
