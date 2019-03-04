import 'dart:math';
import 'package:flurses/flurses.dart';

// TODO: Main axis size, alignment, etc.
class Row extends MultiChildRenderWidget {
  Row({@required Iterable<Widget> children, Key key})
      : super(key: key, children: children.toList());

  @override
  Point<int> computeRenderSize(BuildContext context) {
    var w = 0, h = 0;

    for (var child in children) {
      var size = Point(1, context.maxY);

      if (child is RenderWidget)
        size = child.computeRenderSize(context);
      else if (child is MultiChildRenderWidget)
        size = child.computeRenderSize(context);

      context = context.withSize(x: context.x + size.x);
      h = max(h, size.y);
      w += size.x;
    }

    return Point(w, h);
  }

  @override
  void build(BuildContext context, render) {
    for (var child in children) {
      int w = 1;

      if (child is RenderWidget)
        w = child.computeRenderSize(context).x;
      else if (child is MultiChildRenderWidget)
        w = child.computeRenderSize(context).x;

      context = context.withSize(x: context.x + w);
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
