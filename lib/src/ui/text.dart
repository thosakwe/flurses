import 'dart:convert';
import 'dart:math';
import 'package:charcode/ascii.dart';
import 'package:io/ansi.dart';
import 'package:flurses/flurses.dart';

class Text extends RenderWidget {
  final String text;
  final Iterable<AnsiCode> ansiCodes;

  const Text(this.text, {Key key, this.ansiCodes: const []}) : super(key: key);

  @override
  Point<int> computeRenderSize(BuildContext context) {
    var w = 0, h = 0;
    var lines = const LineSplitter().convert(text);

    for (var line in lines) {
      w = max(w, line.length);
      h++;
    }

    return Point(w, h);
  }

  @override
  void build(BuildContext context) {
    // Esc[Line;ColumnH
    context.sink
      ..add([$esc, $lbracket])
      ..write(context.y)
      ..writeCharCode($semicolon)
      ..write(context.x)
      ..writeCharCode($H)
      ..write(wrapWith(text, ansiCodes));
  }
}
