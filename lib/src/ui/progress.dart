import 'dart:math';
import 'package:flurses/flurses.dart';
import 'package:io/ansi.dart';

class ProgressBar extends RenderWidget {
  static const String full = '\u{2588}',
      lightShade = '\u{2591}',
      mediumShade = '\u{2592}',
      darkShade = '\u{2593}',
      upperHalf = '\u{2580}',
      lowerHalf = '\u{2584}';

  final double value;
  final int height;
  final String text;
  final Iterable<AnsiCode> ansiCodes;

  ProgressBar(
      {@required this.value,
      this.height = 1,
      this.text = full,
      this.ansiCodes = const [],
      Key key})
      : super(key: key);

  @override
  Point<int> computeRenderSize(BuildContext context) {
    return Point(context.size.x, height);
  }

  void _draw(BuildContext context, String t) {
    var extent = (context.size.x * value).round();

    for (int y = 0; y < height; y++) {
      var buf = StringBuffer();
      context.moveTo(context.x, context.y + y);
      for (int x = 0; x < extent; x++) buf.write(t);
      context.sink.write(wrapWith(buf.toString(), ansiCodes));
    }
  }

  @override
  void build(BuildContext context) {
    _draw(context, text);
  }

  @override
  void destroy(BuildContext context) {
    _draw(context, ' ');
  }
}
