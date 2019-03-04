import 'dart:math';
import 'package:flurses/flurses.dart';

// TODO: Main axis size, alignment, etc.
class Stack extends MultiChildRenderWidget {
  Stack({@required Iterable<Widget> children, Key key})
      : super(key: key, children: children.toList());

  @override
  Point<int> computeRenderSize(BuildContext context) {
    var w = 0, h = 0;

    for (var child in children) {
      var size = Point(context.maxX, context.maxY);

      if (child is RenderWidget)
        size = child.computeRenderSize(context);
      else if (child is MultiChildRenderWidget)
        size = child.computeRenderSize(context);

      context = context.withSize(y: context.y + size.y);
      // w = max(w, size.x);
      w += size.x;
      h += size.y;
    }

    return Point(w, h);
  }

  @override
  void build(BuildContext context, render) {
    for (var child in children) {
      render(child, context);
    }
  }

  @override
  void destroy(BuildContext context) {
    for (var child in children) {
      if (child is RenderWidget)
        child.destroy(context);
      else if (child is MultiChildRenderWidget) child.destroy(context);
      // TODO: How to destroy other children?
    }
  }
}
