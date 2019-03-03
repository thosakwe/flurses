import 'dart:math';
import 'package:charcode/ascii.dart';
import 'package:flurses/flurses.dart';
import 'package:io/ansi.dart';

class HorizontalLine extends RenderWidget {
  static const String light = '\u{2500}', heavy = '\u{2501}';

  final String text;
  final Iterable<AnsiCode> ansiCodes;

  HorizontalLine({this.text: light, this.ansiCodes: const []});

  @override
  Point<int> computeRenderSize(BuildContext context) {
    return Point(context.maxX, 1);
  }

  @override
  void build(BuildContext context) {
    for (int x = context.x; x <= context.maxX; x++) {
      // Esc[Line;ColumnH
      context.sink
        ..add([$esc, $lbracket])
        ..write(context.y)
        ..writeCharCode($semicolon)
        ..write(x)
        ..writeCharCode($H)
        ..write(wrapWith(text, ansiCodes));
    }
  }
}

class VerticalLine extends RenderWidget {
  static const String light = '\u{2502}', heavy = '\u{2503}';

  final String text;
  final Iterable<AnsiCode> ansiCodes;

  VerticalLine({this.text: light, this.ansiCodes: const []});

  @override
  Point<int> computeRenderSize(BuildContext context) {
    return Point(1, context.maxY);
  }

  @override
  void build(BuildContext context) {
    for (int y = context.y; y <= context.maxY; y++) {
      // Esc[Line;ColumnH
      context.sink
        ..add([$esc, $lbracket])
        ..write(y)
        ..writeCharCode($semicolon)
        ..write(context.x)
        ..writeCharCode($H)
        ..write(wrapWith(text, ansiCodes));
    }
  }
}
