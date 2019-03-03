import 'package:charcode/ascii.dart';
import 'package:flurses/flurses.dart';

class Text extends RenderWidget {
  final String text;

  const Text(this.text, {Key key}) : super(key: key);

  @override
  void build(BuildContext context) {
    // Esc[Line;ColumnH
    context.sink
      ..add([$esc, $lbracket])
      ..write(context.y)
      ..writeCharCode($semicolon)
      ..write(context.x)
      ..writeCharCode($H)
      ..write(text);
  }
}
