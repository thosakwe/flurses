import 'dart:math';
import 'package:flurses/flurses.dart';

class Text extends RenderObjectWidget {
  // TODO: Assert non-null?
  final String text;

  const Text(this.text);

  @override
  Rectangle<int> computeBounds(BuildContext context) {
    return Rectangle(0, 0, text.length, 1);
  }

  @override
  void render(BuildContext context, Rectangle<int> computedBounds) {
    // TODO: Catch overflows?
    var term = context.terminal;
    term.writeString(computedBounds.left, computedBounds.top, text);
  }
}
