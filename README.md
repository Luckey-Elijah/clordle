# Clordle

A Wordle clone in the command line.

[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

## Playing

Show game options:

```
$ dart run clordle play --help
```

```
Start the Clordle game.

Usage: clordle play [arguments]
-h, --help    Print this usage information.
-w, --word    The target word. Used for debugging.
              (defaults to "CRANE")
-m, --max     The max number of guesses/tries.
              (defaults to "6")

Run "clordle help" to see global options.
```

Start playing:

```
$ dart run clordle play
```

![Gameplay of world - A Wordle clone in the command line.](assets/gameplay.png)
