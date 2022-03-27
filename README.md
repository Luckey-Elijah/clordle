# Clordle

A Wordle clone in the command line.

[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

## Playing

```
$ dart run clordle play
Building package executable...
Built clordle:clordle.
GUESS: TESTS
┌───┬───┬───┬───┬───┐
│ T │ E │ S │ T │ S │
└───┴───┴───┴───┴───┘
5 remain guesses.
┌─────────────────────┐
│ Q W E R T Y U I O P │
│  A S D F G H J K L  │
│    Z X C V B N M    │
└─────────────────────┘
GUESS: OTHER
┌───┬───┬───┬───┬───┐
│ T │ E │ S │ T │ S │
│ O │ T │ H │ E │ R │
└───┴───┴───┴───┴───┘
4 remain guesses.
┌─────────────────────┐
│ Q W E R T Y U I O P │
│  A S D F G H J K L  │
│    Z X C V B N M    │
└─────────────────────┘
GUESS: DRAG
┌───┬───┬───┬───┬───┐
│ T │ E │ S │ T │ S │
│ O │ T │ H │ E │ R │
│ D │ R │ A │ G │   │
└───┴───┴───┴───┴───┘
3 remain guesses.
┌─────────────────────┐
│ Q W E R T Y U I O P │
│  A S D F G H J K L  │
│    Z X C V B N M    │
└─────────────────────┘
GUESS: WIRED
┌───┬───┬───┬───┬───┐
│ T │ E │ S │ T │ S │
│ O │ T │ H │ E │ R │
│ D │ R │ A │ G │   │
│ W │ I │ R │ E │ D │
└───┴───┴───┴───┴───┘
2 remain guesses.
┌─────────────────────┐
│ Q W E R T Y U I O P │
│  A S D F G H J K L  │
│    Z X C V B N M    │
└─────────────────────┘
GUESS: CORNS
┌───┬───┬───┬───┬───┐
│ T │ E │ S │ T │ S │
│ O │ T │ H │ E │ R │
│ D │ R │ A │ G │   │
│ W │ I │ R │ E │ D │
│ C │ O │ R │ N │ S │
└───┴───┴───┴───┴───┘
1 remain guesses.
┌─────────────────────┐
│ Q W E R T Y U I O P │
│  A S D F G H J K L  │
│    Z X C V B N M    │
└─────────────────────┘
GUESS: CRANE
You won!
```
