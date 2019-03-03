import 'dart:math';
import 'package:charcode/ascii.dart';
import 'package:flurses/flurses.dart';
import 'package:io/ansi.dart';

/// Clears the working area of the screen, using the given [ansiCodes].
class Clear extends RenderWidget {
  final Iterable<AnsiCode> ansiCodes;

  Clear({this.ansiCodes: const []});

  @override
  Point<int> computeRenderSize(BuildContext context) {
    return Point(context.maxX - context.x, context.maxY - context.y);
  }

  @override
  void build(BuildContext context) {
    // context.sink.add([$esc, $lbracket]);

    // for (var code in ansiCodes) {
    //   context.sink
    //     ..write(code.code)
    //     ..writeCharCode($semicolon);
    // }

    // context.sink.writeCharCode($m);

    // Now, loop through the desired part of the screen, and clear it.
    for (int y = context.y; y <= context.maxY; y++) {
      for (int x = context.x; x <= context.maxX; x++) {
        // Esc[Line;ColumnH
        context.sink
          ..add([$esc, $lbracket])
          ..write(y)
          ..writeCharCode($semicolon)
          ..write(x)
          ..writeCharCode($H)
          ..write(wrapWith(' ', ansiCodes));
      }
    }
  }
}