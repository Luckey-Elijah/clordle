import 'dart:math';

import 'package:clordle/clordle.dart';

String getWord() {
  final index = Random().nextInt(words.length);
  return words[index];
}
