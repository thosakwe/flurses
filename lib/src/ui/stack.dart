import 'dart:math';
import 'package:flurses/flurses.dart';

// TODO: Main axis size, alignment, etc.
class Stack extends MultiChildRenderWidget {
  Stack({@required Iterable<Widget> children, Key key})
      : super(key: key, children: children.toList());

  @override
  Point<int> computeRenderSize(BuildContext context) {
    return context.size;
  }

  @override
  void build(BuildContext context, render) {
    for (var child in children) {
      render(child, context);
    }
  }
}
