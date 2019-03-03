import 'package:charcode/ascii.dart';
import 'package:io/ansi.dart';
import 'package:flurses/flurses.dart';

class Text extends RenderWidget {
  final String text;
  final Iterable<AnsiCode> ansiCodes;

  const Text(this.text, {Key key, this.ansiCodes: const []}) : super(key: key);

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
