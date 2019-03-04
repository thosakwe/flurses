import 'dart:math';

import 'package:flurses/flurses.dart';

class SizedBox extends MultiChildRenderWidget {
  final Widget child;
  final Point<int> size;

  factory SizedBox(
      {@required Widget child, int width: -1, int height: -1, Key key}) {
    return SizedBox.fromSize(
      child: child,
      size: Point(width, height),
      key: key,
    );
  }

  SizedBox.fromSize({@required this.child, @required this.size, Key key})
      : super(key: key);

  @override
  Point<int> computeRenderSize(BuildContext context) {
    var x = size.x;
    var y = size.y;
    if (x == -1) x = context.maxX;
    if (y == -1) x = context.maxY;
    return Point(x, y);
  }

  @override
  void build(BuildContext context, render) {
    var size = computeRenderSize(context);
    context =
        context.withSize(maxX: context.x + size.x, maxY: context.y + size.y);
    render(child, context);
  }

  @override
  void destroy(BuildContext context) {
    var child = this.child;
    if (child is RenderWidget)
      child.destroy(context);
    else if (child is MultiChildRenderWidget) child.destroy(context);
    // TODO: How to destroy other children?
  }
}
